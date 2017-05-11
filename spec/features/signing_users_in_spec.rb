require "rails_helper"

RSpec.feature "User signs in" do
  before do
    @john = User.create!(email: "john@example.com",
                         password: "password")
  end

  scenario "with valid credentials" do
    visit "/"
<<<<<<< HEAD:spec/features/signing_users_in_spec.rb

    click_link "Sign in"
=======
   
    click_link "Tap in"
   
>>>>>>> origin/master:spec/features/users/signing_users_in_spec.rb
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@john.email}")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end

end
