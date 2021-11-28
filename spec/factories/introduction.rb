FactoryBot.define do
  factory :introduction do
    place { Faker::Lorem.characters(number: 30) }
    author { Faker::Lorem.characters(number: 30) }
    Introduction.address_prefectures.each do |prefecture|
      trait :"#{prefecture}" do
        address_prefecture { prefecture }
      end
    end
    address_after_prefecture { Faker::Lorem.characters(number: 50) }
    introduction { Faker::Lorem.characters(number: 200) }
    user
  end
end