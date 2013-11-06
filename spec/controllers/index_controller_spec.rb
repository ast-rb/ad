require 'spec_helper'

describe IndexController do

  describe "show action" do

    #Тестируем на рендеринг
    it 'renders show template' do
      ad = FactoryGirl.create(:ad)
      get :show, {id:ad.id}
      response.should render_template('show')
    end

    it 'render 404 page if an item is not found' do
      get :show, {id:0}
      response.status.should == :redirect
    end

  end

  describe 'create action' do
    it 'redirect to image crop if validation pass'


    it 'renders new page again if validation fail'



  end

end