require 'selenium-webdriver'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/tests/TestsSetUp.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/MainPage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/CreateAccountPage.rb'
require '/Users/marinashvachko/RubymineProjects/Guru99EcommercePrRubyAut/pages/AccountPage.rb'
require 'test/unit'

class CreateAccount < Test::Unit::TestCase
  BROWSER = 'firefox'.freeze
  FIRST_NAME = 'Test222'
  LAST_NAME = 'Test222'
  EMAIL = 'email23434222@gmail.com'
  PASSWORD = '12345678'
  CONFIRM_PASSWORD = '12345678'
  EXPECTED_TXT_AFTER_REG = 'Thank you for registering with Main Website Store'

  def test_create_account_share_wishlist
    driver = TestsSetUp.open_browser(BROWSER)
    driver.manage.window.maximize
    driver.manage.timeouts.implicit_wait = 5
    main_page = MainPage.new(driver)
    driver.get 'http://live.techpanda.org/index.php/'

    create_account_page = main_page.open_create_account_page
    create_account_page.fill_mandatory_reg_field(FIRST_NAME, LAST_NAME, EMAIL, PASSWORD, CONFIRM_PASSWORD)
    account_page = create_account_page.click_register_button
    txt_after_reg = account_page.txt_after_registration

    assert_equal(EXPECTED_TXT_AFTER_REG, txt_after_reg)

    account_page.open_tv_dir





    sleep(4)

    TestsSetUp.tear_down
  end
end
