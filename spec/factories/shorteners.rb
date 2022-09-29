FactoryBot.define do
  factory :shortener do
    url { Faker::Internet.url }
    short_code { '234567' }
    alexa_rank { 14 }
    counter { 1 }
  end
end
