class ManageAdsController < ApplicationController
  authorize_resource :class => false

  before_filter :find_ad_by_id, only: [:edit, :update, :destroy]

  def index
    @search = Ad.with_type.where("state != ?", 'draft').ransack(params[:q])
    @manage_ads = @search.result.order('created_at DESC')
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end

  def search
    index
    render :index
  end

  def edit
  end

  def update

    if @manage_ad.update_attributes(params[:ad])
      MessageForUser.send_status(@manage_ad).deliver
      redirect_to manage_ads_path, notice: t('notice.succ_update', elem: Ad.model_name.human)
    else
      render action: "edit"
    end

  end

  def destroy
    @manage_ad.destroy
    redirect_to manage_ads_url, notice: t('notice.succ_del', elem: Ad.model_name.human)
  end

  private
  def find_ad_by_id
    @manage_ad = Ad.find(params[:id])
  end

end
