# Read about factories at https://github.com/thoughtbot/factory_girl

# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "John#{n}" }
    last_name             "Doe"
    sequence(:email)      { |n| "test#{n}@ralphlauren.com" }
    password              "testing123"
    password_confirmation "testing123"
    admin                 false

    factory :admin do
      admin               true
    end

    factory :invalid_user do
      email               nil
    end
  end
end
