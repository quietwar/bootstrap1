require "rails_helper"

RSpec.feature "Creating Home Page" do
  scenario do

    visit "/"

    expect(page).to have_link('Projects')
    expect(page).to have_link('Profiles')
    expect(page).to have_content('Genius Projects')
    expect(page).to have_content('Meet the Cohorts')
  end
end
