class Contractor < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, on: :create
    validates :hourly_rate, presence: true
    validates :specialty, presence: true
end
