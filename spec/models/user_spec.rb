require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:username) }

    it { should validate_length_of(:username).is_at_least(6).is_at_most(25) }

    it { should validate_uniqueness_of(:username).case_insensitive }
  end

  describe "associations" do
    it { should have_many(:movies) }
    it { should have_many(:votes) }
  end
end
