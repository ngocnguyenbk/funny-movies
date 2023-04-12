require "rails_helper"

RSpec.describe "User logout", js: true, type: :feature do
  before do
    log_in
  end

  scenario "with log out success" do
    find("a", text: "Logout").click

    expect(page).to have_content("Signed out successfully.")
  end
end
