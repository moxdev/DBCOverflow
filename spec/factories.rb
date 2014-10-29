FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "title#{n}" }
    content "content"
  end
end

FactoryGirl.define do
  factory :answer do
    sequence(:title) {|n| "title#{n}" }
    content "content"
  end
end
