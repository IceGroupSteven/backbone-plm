# Read about factories at https://github.com/thoughtbot/factory_girl

# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name            "John"
    last_name             "Doe"
    email                 "test@ralphlauren.com"
    password              "testing123"
    password_confirmation "testing123"
    admin                  false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name            "John"
    last_name             "Doe"
    email                 "admin@ralphlauren.com"
    password              "testing123"
    password_confirmation "testing123"
    admin                  true
  end

  factory :no_password_confirmation, class: User do
    admin
    password_confirmation nil
  end

end