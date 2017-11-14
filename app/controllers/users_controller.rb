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
      flash[:alert] = "Alert message"
      redirect_to '/' #goes back to sign in/sign up. would be nice to add error messages.
    end
  end

  def show
    # if logged_in?
      @user = current_user
    # end

    @message = params[:message] if params[:message]
    @message ||= false
  end

  # def show
  #   @message = params[:message] if params[:message]
  #   @message ||= false
  # end

  def update
    @user = current_user
    redirect_to user_path(@user)
#     @user = current_user
#     @ride = Ride.create(
#
#       user_id: @user.id
#       # attraction_id:
#
#       # :attraction_id => params[:attraction_id]
#
#     )
# # binding.pry
#     @ride.take_ride
#     redirect_to user_path(@ride.user)
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
