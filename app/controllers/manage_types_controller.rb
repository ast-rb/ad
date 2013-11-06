
class ManageTypesController < ApplicationController
  # GET /manage_types
  # GET /manage_types.json
  def index
    @manage_types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manage_types }
    end
  end

  # GET /manage_types/1
  # GET /manage_types/1.json
  def show
    @manage_type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manage_type }
    end
  end

  # GET /manage_types/new
  # GET /manage_types/new.json
  def new
    @manage_type = ManageType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manage_type }
    end
  end

  # GET /manage_types/1/edit
  def edit
    @manage_type = ManageType.find(params[:id])
  end

  # POST /manage_types
  # POST /manage_types.json
  def create
    @manage_type = Type.new(params[:manage_type])

    respond_to do |format|
      if @manage_type.save
        format.html { redirect_to @manage_type, notice: 'Manage type was successfully created.' }
        format.json { render json: @manage_type, status: :created, location: @manage_type }
      else
        format.html { render action: "new" }
        format.json { render json: @manage_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manage_types/1
  # PUT /manage_types/1.json
  def update
    @manage_type = ManageType.find(params[:id])

    respond_to do |format|
      if @manage_type.update_attributes(params[:manage_type])
        format.html { redirect_to @manage_type, notice: 'Manage type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manage_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage_types/1
  # DELETE /manage_types/1.json
  def destroy
    @manage_type = Type.find(params[:id])
    @manage_type.destroy

    respond_to do |format|
      format.html { redirect_to manage_types_url }
      format.json { head :no_content }
    end
  end
end
