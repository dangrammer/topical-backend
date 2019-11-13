class UsersController < ApplicationController 
skip_before_action :authorized, only: [:create]

  # def index
  #   users = User.all
  #   render json: users
  # end

  def show
    if current_user.id == params[:id].to_i
      render json: current_user, include: :collections
    else
      render json: {go_away: true}, status: :unauthorized
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: {errors: 'failed to create user'}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
