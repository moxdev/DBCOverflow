require 'spec_helper'

RSpec.describe Answer, :type => :model do
  context "associations" do
    it { should belong_to(:question) }
  end
end
