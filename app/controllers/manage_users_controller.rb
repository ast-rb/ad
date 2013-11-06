
class ManageUsersController < ApplicationController
  # GET /manage_users
  # GET /manage_users.json
  def index
    @manage_users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manage_users }
    end
  end

  # GET /manage_users/1
  # GET /manage_users/1.json
  def show
    @manage_user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manage_user }
    end
  end

  # GET /manage_users/new
  # GET /manage_users/new.json
  def new
    @manage_user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manage_user }
    end
  end

  # GET /manage_users/1/edit
  def edit
    @manage_user = User.find(params[:id])
  end

  # POST /manage_users
  # POST /manage_users.json
  def create
    @manage_user = ManageUser.new(params[:manage_user])

    respond_to do |format|
      if @manage_user.save
        format.html { redirect_to @manage_user, notice: 'Manage user was successfully created.' }
        format.json { render json: @manage_user, status: :created, location: @manage_user }
      else
        format.html { render action: "new" }
        format.json { render json: @manage_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manage_users/1
  # PUT /manage_users/1.json
  def update
    @manage_user = ManageUser.find(params[:id])

    respond_to do |format|
      if @manage_user.update_attributes(params[:manage_user])
        format.html { redirect_to @manage_user, notice: 'Manage user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manage_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage_users/1
  # DELETE /manage_users/1.json
  def destroy
    @manage_user = ManageUser.find(params[:id])
    @manage_user.destroy

    respond_to do |format|
      format.html { redirect_to manage_users_url }
      format.json { head :no_content }
    end
  end
end
