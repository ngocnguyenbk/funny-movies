require "rails_helper"

RSpec.describe "Visitor register", js: true, type: :feature do
  scenario "with valid username and password" do
    register_with "admin2711", "password"

    expect(page).to have_content("Wellcome admin2711@example.com")
  end

  scenario "with blank password" do
    register_with "admin2711", ""

    expect(page).to have_content("Password can't be blank")
  end

  scenario "with blank username" do
    register_with "", "password"

    expect(page).to have_content("Username can't be blank")
  end
end
