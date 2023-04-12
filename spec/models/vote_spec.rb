require "rails_helper"

RSpec.describe Vote, type: :model do
  describe "validations" do
    it { should validate_presence_of(:vote_type) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end
end
