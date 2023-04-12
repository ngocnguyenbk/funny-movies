require "rails_helper"

RSpec.describe "Visitor login in", js: true, type: :feature do
  scenario "with valid username and password" do
    log_in

    expect(page).to have_content("Wellcome admin2711@gmail.com")
  end

  scenario "with invalid username" do
    log_in_with("invalid", "password")

    expect(page).to have_content("Invalid username or password")
  end
end
