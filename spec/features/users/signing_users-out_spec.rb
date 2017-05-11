require "rails_helper"
 
RSpec.feature "Users signout" do
 
  before do
   
    @john = User.create!(email: "john@example.com", password: "password")
 
  end
 
  scenario "with valid credentials" do
   
    visit "/"
   
    click_link "Tap in"
   
    fill_in "Email", with: @john.email
   
    fill_in "Password",  with: @john.password
   
    click_button "Log in"
  end
  scenario do 

    visit "/"
   
    click_link "Tap out"
   
    expect(page).to have_content("Signed out successfully.")
   
 
  end
end