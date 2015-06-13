class CoverageCheckService
  HOST = 'https://selfsolve.apple.com'
  PAGE = '/agreementWarrantyDynamic.do'

  def self.check(imei)
    new(imei).check
  end

  def initialize(imei)
    @imei = imei
  end

  def check
    submit_form
    check_page
  end

  private

  attr_reader :imei

  def submit_form
    @page = FormAutomationService.new(HOST, PAGE).automate do |page|
      page.fill_in 'sn', with: imei
      page.click_button 'Continue'
    end
  end

  def check_page
    case 
    when @page.find('#hardware').has_selector?('#hardware-true') then true
    when @page.find('#hardware').has_selector?('#hardware-false') then false
    else fail 'undefined'
    end
  end 
end
