# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :knits, class: Division do
    name "Knits"
  end

  factory :wovens, class: Division do
    name "Wovens"
  end

  factory :pants, class: Division do
    name "Pants"
  end
end
