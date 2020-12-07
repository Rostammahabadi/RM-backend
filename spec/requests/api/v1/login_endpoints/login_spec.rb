require 'rails_helper'

describe "User can login using email and password" do
    it "returns user object with token" do
        user = create(:user)
        post "/api/v1/login?email=#{user.email}&password=#{user.password}"

        expect(response).to be_successful
        user_response = JSON.parse(response.body)

        expect(user_response['data']['user']['token']).not_to eq(nil)
    end
    it "returns errors when either the email or password are incorrect" do
        user = create(:user)
        post "/api/v1/login?email=asdf@gmail.com&password=#{user.password}"

        expect(response).not_to be_successful
        user_response = JSON.parse(response.body)
        expect(user_response['data']['user']['errors']).to eq "The email or password is incorrect"

        post "/api/v1/login?email=#{user.email}&password=asdf"

        expect(response).not_to be_successful
        user_response = JSON.parse(response.body)
        
        expect(user_response['data']['user']['errors']).to eq "The email or password is incorrect"
    end
end