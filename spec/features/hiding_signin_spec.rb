require "rails_helper"

RSpec.feature "Hiding signin link" do
  scenario do
    @john = User.create!(email: "john@example.com",
                         password: "password")
  end

  scenario "upon successful signin" do
    visit "/"

    click_link "Tap in"
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    click_button "Tap in"

    expect(page).to have_link("Tap out")
    expect(page).not_to have_link("Tap in")
    expect(page).not_to have_link("Sign up")
  end
end
