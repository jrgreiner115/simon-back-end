class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params["username"])
    if (@user && @user.authenticate(params["password"]))


      token = generate_token

      render json: {
        token: token,
        username: @user.username,
        id: @user.id,
        recordings: @user.recordings
      }
    else
      render json: {
        errors: "Your username and/or password doesn't match anything in our records."
      }, status: :unauthorized
    end
  end
end
