require_relative 'BasePage'

class MainPage < BasePage

  MOBILE = { css: '.level0.nav-1.first' }
  ACCOUNT_MENU = { css: ".skip-link.skip-account" }
  REGISTER_LINK = { link_text: 'Register'}

  def open_mobile_dir
    @driver.find_element(MOBILE).click
    mobile_page = MobilePage.new(@driver)
    return mobile_page
  end

  private

  def open_account_menu
    @driver.find_element(ACCOUNT_MENU).click
  end

  public

  def open_create_account_page
    open_account_menu
    @driver.find_element(REGISTER_LINK).click
    return CreateAccountPage.new(@driver)
  end

end

