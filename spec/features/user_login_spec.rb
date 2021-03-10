require "rails_helper"

RSpec.feature "User can login", type: :feature, js: true do

  before :each do
    @user = User.create! first_name: "Ali", last_name: "Bas", email: "alibas01@gmail.com", password: "12qw", password_confirmation: "12qw"
  end

  scenario "they can login" do
    # ACT
    visit "/login"
    fill_in "email", with: "alibas01@gmail.com"
    fill_in "password", with: "12qw"
    click_button "Submit"
    expect(page).to have_text "Signed in as alibas01@gmail.com"
    sleep(1)
    save_screenshot("test.png")
  end
end