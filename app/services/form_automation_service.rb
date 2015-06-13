class FormAutomationService
  include Capybara::DSL

  def initialize(host, page)
    @host, @page = host, page
  end

  def automate
    Capybara.app_host = @host
    visit @page
    yield page
    page
  end
end
