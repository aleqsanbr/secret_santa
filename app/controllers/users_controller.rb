class UsersController < ApplicationController
  before_action :require_login, only: [ :edit, :update, :show ]
  before_action :authorize_user, only: [ :edit, :update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "Account created successfully! Please log in."
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User updated successfully!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def authorize_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def require_login
    unless current_user
      flash[:alert] = "Please log in to continue."
      redirect_to login_path
    end
  end
end
