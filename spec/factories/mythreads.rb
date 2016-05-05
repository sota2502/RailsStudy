FactoryGirl.define do
  factory :mythread do
    user
    sequence(:title) { |n| "title#{n}"  }
    sequence(:body)  { |n| "body#{n}" }
  end
end
