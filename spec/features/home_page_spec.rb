require 'rails_helper'

RSpec.feature 'On home page', type: :feature do
  scenario 'User sees IMEI prompt' do
    visit '/'
    expect(page).to have_content 'Scrape Demo'
  end
end