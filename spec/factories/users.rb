FactoryGirl.define do
  factory :user do
    sequence(:email){ |i| "email#{i}@email.com"}
    password  'Megapassword'
    sequence(:username){ |i| "user#{i}"}
  end
end