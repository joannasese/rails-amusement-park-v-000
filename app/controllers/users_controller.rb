class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]


  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user) #users/:id
    else
      redirect_to '/' #goes back to sign in/sign up
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :height,
      :tickets,
      :happiness,
      :nausea,
      :admin
    )
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

end
