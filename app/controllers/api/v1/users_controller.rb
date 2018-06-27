class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(
      name: params[:name],
      username: params[:username],
      password: params[:password],)
    if @user && @user.authenticate(params[:password])
      @user.save
      render json: {
        username: @user.username,
        id: @user.id,
        recordings: @user.recordings
      }
    else
      render json: {
        errors: "THIS DIDN'T WORK"
      }
    end
  end


end
