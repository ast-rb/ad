class AdsController < ApplicationController

  before_filter :authenticate_user!

  def index
    if params[:query].present?
      @ads = Ad.search(params[:query], where: {user_id: current_user.id}, load: true)
    else
      @ads = current_user.ads.order('created_at DESC').all
    end
  end

  def autocomplete
    render json: Ad.search(params[:query], where: {user_id: current_user.id}, autocomplete: true).map(&:title)
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
    redirect_to action: :index unless @ad && (@ad.state == 'draft' || @ad.state == 'archive')
  end


  def create

    @ad = Ad.new(params[:ad])
    @ad.user_id = current_user.id

    if @ad.save
      redirect_to @ad, notice: t('notice.succ_create', elem: Ad.model_name.human)
    else
      render action: "new"
    end

  end


  def update

    # Есть возможность изменить любую
    @ad = Ad.find(params[:id])

    # Рефакторинг, допустим перенести в модель допустим в колбек

    unless @ad.user_id == current_user.id
      redirect_to ads_path, notice: t('notice.ad_other_user') and return
    end

    unless params[:ad][:state_event] == '' || params[:ad][:state_event] == 'send_manager' || 'return'
      redirect_to ads_path, notice: t('notice.state_denied') and return
    end

    if @ad.update_attributes(params[:ad])
      redirect_to @ad, notice: t('notice.succ_update', elem: Ad.model_name.human)
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
