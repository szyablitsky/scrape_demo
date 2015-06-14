require 'rails_helper'

RSpec.describe CoverageCheckService do
  around do |example|
    Capybara.current_driver = :poltergeist
    example.run
    Capybara.current_driver = :rack_test
  end

  describe '.check' do
    it 'should return false for expired service' do
      VCR.use_cassette('apple coverage service') do
        expect(described_class.check('013896000639712')).to eq false
      end
    end

    it 'should return true for active service' do
      VCR.use_cassette('apple coverage service') do
        expect(described_class.check('013977000323877')).to eq true
      end
    end
  end
end
