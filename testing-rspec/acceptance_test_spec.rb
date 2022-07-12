# spec/system/user_signs_up_spec.rb

require "spec_helper"

describe "User signs up" do
  it "signs up the user with valid details" do
    visit sign_up_path

    within_fieldset "Sign up" do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "Examp1ePa$$"
      click_button "Sign up"
    end

    expect(page).to have_button("Sign out")
  end
end
