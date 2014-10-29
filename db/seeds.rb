# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "title#{n}" }
    content "content"
  end
end

FactoryGirl.define do
  factory :answer do
    sequence(:title) {|n| "title#{n}" }
    content "CONtent"
  end
end


10.times do
  FactoryGirl.create :question
end

10.times do
  FactoryGirl.create :answer
end
