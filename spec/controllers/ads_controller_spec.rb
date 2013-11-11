require 'spec_helper'

describe AdsController do

  describe "index action" do

    #Тестируем на рендеринг
    it 'Without authentification' do
      ads = FactoryGirl.create(:ad)
      get :show, {id: ads.id}
      response.should render_template('show')
    end

    it 'With authentification' do
      @user = FactoryGirl.create(:user)
      @user.roles = FactoryGirl.create(:role_admin) 
      sign_in @user
      ads = FactoryGirl.create(:ad)
      get :show, {id: ads.id}
      response.should render_template('show')
    end
  
  end

end