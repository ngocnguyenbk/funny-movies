require "rails_helper"

RSpec.describe CreateMovieService, type: :service do
  describe "#call" do
    let(:user) { create(:user) }
    let(:url) { "https://www.youtube.com/watch?v=IeR2g9692sM&ab_channel=RINMusic" }
    let(:service) { described_class.new(url, user) }

    context "when url is valid" do
      it "creates a movie" do
        expect { service.call }.to change { Movie.count }.by(1)
      end

      it "returns true" do
        expect(service.call).to eq(true)
      end
    end

    context "when url is invalid" do
      let(:url) { "https://www.youtube.com/watch?v=2" }

      it "does not create a movie" do
        expect { service.call }.not_to(change { Movie.count })
      end

      it "returns false and an error message" do
        expect(service.call).to eq([false, "Url is not valid, video_id is not found: #{url}"])
      end
    end
  end
end
