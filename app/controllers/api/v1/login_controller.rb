class Api::V1::LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'jwt'
  def create
    email = params[:email]
    user = User.find_by email: email
    if user && user.authenticate(params[:password]) 
      return_token(user)
    else
      user_error
    end
  end

  private

  def generate_token(user)
    time = (Time.now + 24.hours.to_i).to_i
    payload = {user_id: user.id, exp: time}
    return JWT.encode payload, nil, 'none'
  end

  def return_token(user)
    token = generate_token(user)
    render json: {data: { user: { token: token } }}, status: 200
  end

  def user_error
    render json: {data: { user: { errors: "The email or password is incorrect"}}}, status: 403
  end

end
