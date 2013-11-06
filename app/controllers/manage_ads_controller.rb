
class ManageAdsController < ApplicationController
  # GET /manage_ads
  # GET /manage_ads.json
  def index
    @manage_ads = ManageAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manage_ads }
    end
  end

  # GET /manage_ads/1
  # GET /manage_ads/1.json
  def show
    @manage_ad = ManageAd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manage_ad }
    end
  end

  # GET /manage_ads/new
  # GET /manage_ads/new.json
  def new
    @manage_ad = ManageAd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manage_ad }
    end
  end

  # GET /manage_ads/1/edit
  def edit
    @manage_ad = ManageAd.find(params[:id])
  end

  # POST /manage_ads
  # POST /manage_ads.json
  def create
    @manage_ad = ManageAd.new(params[:manage_ad])

    respond_to do |format|
      if @manage_ad.save
        format.html { redirect_to @manage_ad, notice: 'Manage ad was successfully created.' }
        format.json { render json: @manage_ad, status: :created, location: @manage_ad }
      else
        format.html { render action: "new" }
        format.json { render json: @manage_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manage_ads/1
  # PUT /manage_ads/1.json
  def update
    @manage_ad = ManageAd.find(params[:id])

    respond_to do |format|
      if @manage_ad.update_attributes(params[:manage_ad])
        format.html { redirect_to @manage_ad, notice: 'Manage ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manage_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage_ads/1
  # DELETE /manage_ads/1.json
  def destroy
    @manage_ad = ManageAd.find(params[:id])
    @manage_ad.destroy

    respond_to do |format|
      format.html { redirect_to manage_ads_url }
      format.json { head :no_content }
    end
  end
end
