require 'rails_helper'

RSpec.describe FormAutomationService do

  let(:host) { 'www.example.com' }
  let(:page) { '/' }
  subject { described_class.new(host, page)}

  before do
    stub_request(:any, "www.example.com")
  end

  around do |example|
    Capybara.current_driver = :poltergeist
    example.run
    Capybara.current_driver = :rack_test
  end

  describe '#automate' do
    xit 'shoud yield page' do
      expect { |b| subject.automate(&b) }.to yield_with_args(Capybara::Session)
    end

    xit 'should return page' do
      expect(subject.automate { }).to be_a(Capybara::Session)
    end
  end
end
