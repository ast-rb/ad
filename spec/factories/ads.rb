FactoryGirl.define do
  factory :ad do
    title 'Ad - 1'
    body 'Here content'
    association :type
    association :user
    state 'draft'
  end
end