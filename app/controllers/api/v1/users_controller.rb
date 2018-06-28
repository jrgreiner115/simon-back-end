class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(userparams)
    if @user.save

      payload = {
        name: @user.name
        username: @user.username
        id: @user.id
      }

      token = JWT.encode payload, ENV['JWT_SECRET'], 'HS256'

      render json: {
        token
        username: @user.username,
        id: @user.id,
        recordings: @user.recordings
      }
    else
      render json: {
        errors: @user.errors.full_message} status: :unprocessable_entity
      }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :username)
    end
end
