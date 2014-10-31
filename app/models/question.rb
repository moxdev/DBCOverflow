class Question < ActiveRecord::Base
  has_many :answers

  response = HTTParty.get(https://api.github.com/zen)

end
