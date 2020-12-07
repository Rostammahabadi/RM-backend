class AuthorizeRequest < ApplicationService
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  def user
    User.find(decoded_token[0]['user_id']) if decoded_token
  end

  def decoded_token
    @decoded_token = JWT.decode auth_header, nil, false if auth_header
  end

  def auth_header
    @headers['token'].split(' ').last if headers['token'].present?
  end
end
