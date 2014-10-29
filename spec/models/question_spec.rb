require 'spec_helper'

RSpec.describe Question, :type => :model do
  context "associations" do
    it {should have_many :answers}
  end
end
