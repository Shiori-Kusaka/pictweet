FactoryBot.define do
  factory :tweet do
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    # users.rbのFactoryBotとアソシエーションがあるから
    association :user
  end
end
