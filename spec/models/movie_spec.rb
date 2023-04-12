require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }

    it { should validate_uniqueness_of(:url) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:votes) }
  end
end
