class Admin::UsersController < ApplicationController
  before_action :admmin_user, only: :destroy
  
  def index
    byebug
    @users = if params[:term]
      User.by_name(params[:term]).paginate(page: params[:page])
    else
      User.all.paginate(page: params[:page])
    end
  end 

  def show
    @user = User.find(params[:id])
  end

def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User deleted"
  redirect_to admin_users_url
end

  private
  def admmin_user
    redirect_to(root_url) unless current_user.admin?
  end
end