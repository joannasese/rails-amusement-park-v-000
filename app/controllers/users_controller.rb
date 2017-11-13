class UsersController < ApplicationController
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
      flash[:alert] = "Alert message"
      redirect_to '/' #goes back to sign in/sign up. would be nice to add error messages.

    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    end
  end

  # def destroy
  #   # reset_session
  #   session[:user_id] = nil
  #   redirect_to '/'
  # end

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

end
