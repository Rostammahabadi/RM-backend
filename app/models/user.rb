class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates_presence_of :password, require: true, :on => :create
end
