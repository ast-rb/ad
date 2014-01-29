class ManageAdsController < ApplicationController
  authorize_resource :class => false

  def index
    #@manage_ads = Ad.where("state != ?", 'draft')
    #@search = Ad.search(params[:q])
    @search = Ad.with_type.where("state != ?", 'draft').ransack(params[:q])
    @manage_ads = @search.result.order('created_at DESC')
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end

  def search
    index
    render :index
  end

  def show
    @manage_ad = Ad.find(params[:id])
  end

  def new
    @manage_ad = Ad.new
  end

  def edit
    @manage_ad = Ad.find(params[:id])
  end

  def create
    @manage_ad = Ad.new(params[:manage_ad])

    if @manage_ad.save
      redirect_to @manage_ad, notice: t('notice.succ_create', elem: Ad.model_name.human)
    else
      render action: "new"
    end
  end

  def update
    @manage_ad = Ad.find(params[:id])

    if @manage_ad.update_attributes(params[:ad])
      MessageForUser.send_status(@manage_ad).deliver
      redirect_to manage_ads_path, notice: t('notice.succ_update', elem: Ad.model_name.human)
    else
      render action: "edit"
    end

  end

  def destroy
    @manage_ad = Ad.find(params[:id])
    @manage_ad.destroy

    redirect_to manage_ads_url, notice: t('notice.succ_del', elem: Ad.model_name.human)
  end

end
