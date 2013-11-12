class ManageUsersController < ApplicationController
  
  # before_filter :find_item, only: [:show, :edit, :destroy, :update]
  authorize_resource :class => false

  def index
    @manage_users = User.all
  end

  def show
    @manage_user = User.find(params[:id])
  end

  def edit
    @manage_user = User.find(params[:id])
  end

  def update
    @manage_user = User.find(params[:id])

    unless @manage_user ==  current_user  
      @role = Role.find(params[:role][:id])
      @manage_user.role = @role 
    end

    if @manage_user.update_attributes(params[:user])
      redirect_to manage_users_path, notice: 'Manage user was successfully updated.' 
    else
      render action: "edit" 
    end
    
  end

  def destroy
    @manage_user = User.find(params[:id])
    @manage_user.destroy

    redirect_to action: "index"
  end




  private

    #def find_item
    #  @manage_user = User.where(id: params[:id]).first
    #  redirect_to manage_users_path, notice: 'Not found page' unless @manage_user
    #end

end
