require 'rails_helper'

RSpec.feature 'Form submit', type: :feature, js: true do
  shared_examples 'form submit' do |return_value, status|
    scenario do
      allow(CoverageCheckService).to receive(:check) { return_value }
      visit '/'
      fill_in 'Enter IMEI', with: '0'
      click_button 'CHECK'
      expect(page).to have_content status
    end
  end

  it_behaves_like 'form submit', false, 'Expired'
  it_behaves_like 'form submit', true, 'Active'

end