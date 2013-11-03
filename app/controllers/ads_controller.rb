
class AdsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @ads = current_user.ads.all
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    # Find_by_id, используется что бы не вызывать эксепшн, или лучше с эксепшн?
    @ad = current_user.ads.find_by_id(params[:id])
    redirect_to action: :index unless @ad
  end

  # GET /ads/new
  # GET /ads/new.json
  def new
    @ad = Ad.new
    image = @ad.images.build
  end

  # GET /ads/1/edit
  def edit

    @ad = current_user.ads.find_by_id(params[:id])
    image = @ad.images.build

    # Возможно как то отрефакторить, но не совсем понимаю как.
    redirect_to action: :index unless @ad && @ad.state == 'draft'


  end

  # POST /ads
  # POST /ads.json
  def create

    @ad = Ad.new(params[:ad])
    @ad.user_id = current_user
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render json: @ad, status: :created, location: @ad }
      else
        format.html { render action: "new" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.json
  def update

    # Есть возможность изменить любую
    @ad = Ad.find(params[:id])

    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

private


end
