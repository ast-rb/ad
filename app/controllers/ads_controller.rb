class AdsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @ads = current_user.ads.all
  end


  def show
    # Find_by_id, используется что бы не вызывать эксепшн, или лучше с эксепшн?
    @ad = current_user.ads.find_by_id(params[:id])
    redirect_to action: :index unless @ad
  end

  def new
    @ad = Ad.new
    image = @ad.images.build
  end

  def edit
    @ad = current_user.ads.find_by_id(params[:id])
    image = @ad.images.build

    # Возможно как то отрефакторить, но не совсем понимаю как.
    redirect_to action: :index unless @ad && @ad.state == 'draft'
  end


  def create

    @ad = Ad.new(params[:ad])
    @ad.user_id = current_user.id
   
    if @ad.save
      redirect_to @ad, notice: 'Ad was successfully created.'
    else
      render action: "new" 
    end
   
  end


  def update

    # Есть возможность изменить любую
    @ad = Ad.find(params[:id])

    # Рефакторинг, допустим перенести в модель допустим в колбек

    unless @ad.user_id == current_user.id
      redirect_to ads_path, notice: 'It is ad other user.' and return
    end 

    unless params[:ad][:state_event] == '' or params[:ad][:state_event] == 'send_manager'
      redirect_to ads_path, notice: 'This state is denied.' and return
    end

    if @ad.update_attributes(params[:ad])
      redirect_to @ad, notice: 'Ad was successfully updated.' 
    else
      render action: "edit" 
    end   
  end


  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_url
  end

private


end
