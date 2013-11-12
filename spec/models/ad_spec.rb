require 'spec_helper'

describe Ad do

  context 'state machine' do
    it 'Method publish must change state ad on published' do
      @ad = FactoryGirl.create(:ad, state: 'approved')
      @ad.state.should == 'approved'
      @ad.publish
      @ad.reload.state.should == 'published'
    end

    it 'Method end must change state ad on archive' do
      @ad = FactoryGirl.create(:ad, state: 'published')
      @ad.state.should == 'published'
      @ad.end
      @ad.reload.state.should == 'archive'
    end
  end

  context 'whenever'  do
    it 'Method task_to_published should change state on published' do
      arc1  =  FactoryGirl.create(:ad, state: 'archive')
      appr =  FactoryGirl.create(:ad, title: 'new text', state: 'approved')
      appr2 =  FactoryGirl.create(:ad, state: 'approved')

      Ad.all.should == [arc1, appr, appr2 ]
      ads = Ad.task_to_published
      ads.should == [appr, appr2]

      ads.each do |ad|
        ad.state.should == 'published'
      end
    end

    it 'Method task_to_move_archive should change state on archive if update_at = 3 days ago' do
      old_update = Date.today - 4.days

      pub1  =  FactoryGirl.create(:ad, state: 'published')
      pub2 =  FactoryGirl.create(:ad, updated_at: old_update, title: 'new text1', state: 'published')
      pub3 =  FactoryGirl.create(:ad, updated_at: old_update, title: 'new text2', state: 'published')

      appr =  FactoryGirl.create(:ad, state: 'approved')

      Ad.all.should == [pub1, pub2, pub3, appr ]
      ads = Ad.task_to_move_archive
      ads.should == [pub2, pub3]

      ads.each do |ad|
        ad.reload.state.should == 'archive'
      end
    end
  end



  context 'Validations' do

    it 'All validations' do
      should validate_presence_of(:title)
      should ensure_length_of(:title).is_at_least(3)
      should validate_presence_of(:body)
    end

  end


  context 'Associaton' do
    it 'Ad must have association with images' do
      should have_many(:images)
    end

    it 'Ad must belong to type' do
      should have_many(:images)
    end

    it 'Ad must belong to user' do
      should have_many(:images)
    end
  end

  #context 'State machine' do
  #  it "State state machine" do
  #    @ad = FactoryGirl.create(:ad)
  #    @ad.state.should == 'draft'
  #  end
  #end



end