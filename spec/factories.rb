FactoryGirl.define do
  factory :user do
    name      "Hartl"
    firstname "Michael"
    email     "michael@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end
