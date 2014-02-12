# Read about factories at https://github.com/thoughtbot/factory_girl

# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name              "John"
    last_name               "Doe"
    email                   "test@ralphlauren.com"
    password                "testing123"
    password_confirmation   { |u| u.password }
    admin                   false
    company

    factory :admin do
      admin                   true
    end

    factory :no_password_confirmation do
      password_confirmation nil
    end

    factory :no_email_user do
      email nil
    end
  end
end
