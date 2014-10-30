# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "Why is it, that... #{n}" }
    content "question_content"
    votes 200
  end
end

FactoryGirl.define do
  factory :answer do
    sequence(:title) {|n| "Well, I'll tell ya about #{n}" }
    content "answer_content"
    votes 200
  end
end


10.times do
  x = FactoryGirl.create :question
  x.answers << (FactoryGirl.create :answer)
  x.answers << (FactoryGirl.create :answer)
  x.answers << (FactoryGirl.create :answer)
  x.answers << (FactoryGirl.create :answer)
end

