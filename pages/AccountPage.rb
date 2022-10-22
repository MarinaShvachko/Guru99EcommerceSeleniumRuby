class AccountPage < BasePage
  TXT_AFTER_REG = {css: '.success-msg'}
  TV_LINK = {xpath: '//a[text()="TV"]'}

  def txt_after_registration
    @driver.find_element(TXT_AFTER_REG).text
  end

  def open_tv_dir
    @driver.find_element(TV_LINK).click
    return ProductDetailPage.new(@driver)
  end
end
