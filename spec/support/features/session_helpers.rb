module Features
  module SessionHelpers
    def register_with(username, password)
      visit root_path
      within("#new_user") do
        fill_in "user_username", with: username
        fill_in "user_password", with: password
        find("#btn-register").click
      end
    end

    def log_in_with(username, password)
      visit root_path
      within("#new_user") do
        fill_in "user_username", with: username
        fill_in "user_password", with: password
        find("#btn-login").click
      end
    end

    def log_in
      user = create(:user)
      visit root_path
      within("#new_user") do
        fill_in "user_username", with: user.username
        fill_in "user_password", with: user.password
        find("#btn-login").click
      end
    end
  end
end
