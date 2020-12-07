FactoryBot.define do
    factory :contractor do
        name {"John Doe"}
        email {"johnDoe@gmail.com"}
        hourly_rate {30}
        specialty {"Carpenter"}
    end
end