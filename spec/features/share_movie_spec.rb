require "rails_helper"

RSpec.describe "Shares movie", js: true, type: :feature do
  before do
    log_in
  end

  scenario "move to share page" do
    visit root_path
    find("a", text: "Share a move").click

    expect(page).to have_content("Share a Youtube movie")
  end

  scenario "with valid data" do
    visit share_path
    fill_in "movie_url", with: "https://www.youtube.com/watch?v=RgKAFK5djSk"
    find("input[type=submit]").click

    expect(page).to have_content(Movie.last.title)
  end

  let(:url) { "https://www.youtube.com/watch?v=123" }

  scenario "with invalid data" do
    visit share_path
    fill_in "movie_url", with: url
    find("input[type=submit]").click

    expect(page).to have_content("Url is not valid, video_id is not found: #{url}")
  end
end
