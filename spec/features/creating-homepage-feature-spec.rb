require "rails_helper"

RSpec.feature "Creating Home Page" do
  scenario do

    visit '/'

    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
    expect(page).to have_content('Sign out')
    expect(page).to have_content('Cohort Projects')
  end
end
