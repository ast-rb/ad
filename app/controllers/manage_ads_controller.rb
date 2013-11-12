class ManageAdsController < ApplicationController
  authorize_resource :class => false

  def index
    #@manage_ads = Ad.where("state != ?", 'draft')
    #@search = Ad.search(params[:q])
    @search = Ad.with_type.where("state != ?", 'draft').search(params[:q])
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
      redirect_to @manage_ad, notice: 'Manage ad was successfully created.'    
    else
       render action: "new" 
    end
  end

  def update
    @manage_ad = Ad.find(params[:id])

    if @manage_ad.update_attributes(params[:ad])
       redirect_to  manage_ads_path, notice: 'Ad was successfully updated.' 
    else
      render action: "edit" 
    end
    
  end

  def destroy
    @manage_ad = Ad.find(params[:id])
    @manage_ad.destroy

    redirect_to manage_ads_url, notice: 'Ad was successfully deleted.'
  end

end
