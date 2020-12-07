require 'rails_helper'

describe "User can get contractors" do
    it "allows a user to get a list of contractors" do
        contractor = create(:contractor)
        user = create(:user)

        post "/api/v1/login?email=#{user.email}&password=#{user.password}"
        user_response = JSON.parse(response.body)
        token = user_response['data']['user']['token']

        get "/api/v1/contractors", headers: {'token': token}
        expect(response).to be_successful
        contractor_response = JSON.parse(response.body)
        expect(contractor_response['data'].length).to eq(1)
        expect(contractor_response['data'][0]['id']).to eq("#{contractor.id}")
        expect(contractor_response['data'][0]['attributes']['email']).to eq(contractor.email)
        expect(contractor_response['data'][0]['attributes']['name']).to eq(contractor.name)
        expect(contractor_response['data'][0]['attributes']['hourly_rate']).to eq(contractor.hourly_rate)
        expect(contractor_response['data'][0]['attributes']['specialty']).to eq(contractor.specialty)
    end

    it "gives and error when no token is passed in" do
        get "/api/v1/contractors"
        
        expect(response).not_to be_successful
    end
end