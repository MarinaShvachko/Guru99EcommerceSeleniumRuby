class CreateAccountPage < BasePage

  FIRST_NAME = { id: 'firstname'}
  LAST_NAME = { id: 'lastname' }
  EMAIL = { id: 'email_address' }
  PASSWORD = { id: 'password' }
  CONFIRM_PASSWORD = { id: 'confirmation'}
  REGISTER_BTN = { xpath: "//button[@title='Register']" }

  def fill_mandatory_reg_field(first_name, last_name, email, password, confirm_password)
    @driver.find_element(FIRST_NAME).send_keys(first_name)
    @driver.find_element(LAST_NAME).send_keys(last_name)
    @driver.find_element(EMAIL).send_keys(email)
    @driver.find_element(PASSWORD).send_keys(password)
    @driver.find_element(CONFIRM_PASSWORD).send_keys(confirm_password)
  end

  def click_register_button
    @driver.find_element(REGISTER_BTN).click
    return AccountPage.new(@driver)
  end

end
