require "rails_helper"

RSpec.feature "Signing out signed-in users" do
  before do
<<<<<<< HEAD:spec/features/signing_users-out_spec.rb
    @john = User.create!(email: "john@example.com",
                         password: "password")

    visit '/'

    click_link "Sign in"
=======
   
    @john = User.create!(email: "john@example.com", password: "password")
 
  end
 
  scenario "with valid credentials" do
   
    visit "/"
   
    click_link "Tap in"
   
>>>>>>> origin/master:spec/features/users/signing_users-out_spec.rb
    fill_in "Email", with: @john.email
    fill_in "Password",  with: @john.password
    click_button "Log in"
  end

  scenario do
    visit "/"
<<<<<<< HEAD:spec/features/signing_users-out_spec.rb

    click_link "Sign out"

=======
   
    click_link "Tap out"
   
>>>>>>> origin/master:spec/features/users/signing_users-out_spec.rb
    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("Sign out")
  end

end
