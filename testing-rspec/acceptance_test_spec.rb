# spec/system/user_signing_up_spec.rb

require "spec_helper"

describe "User signing up" do
  it "with valid email and password" do
    visit sign_up_path

    within "#sign_up" do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "Examp1ePa$$"
      click_button "Sign up"
    end

    expect(page).to have_content("Sign out")
  end
end
