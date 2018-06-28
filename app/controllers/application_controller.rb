class ApplicationController < ActionController::API
  def generate_token
    payload = {
      name: @user.name,
      username: @user.username,
      id: @user.id
    }

    token = JWT.encode payload, ENV['JWT_SECRET'], 'HS256'
  end

end
