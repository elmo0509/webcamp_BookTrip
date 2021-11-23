class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @loginuser = current_user
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :nickname, :image, :introduction)
  end


end
