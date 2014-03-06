FactoryGirl.define do
  factory :user do

    name "Ada Doe"
    email "ada@adadoe.com"
    password "gogo1234"
    password_confirmation "gogo1234"
  end

  factory :invalid_user do
    name " "
    email " "
    address "invalid invalid"
  end
end
