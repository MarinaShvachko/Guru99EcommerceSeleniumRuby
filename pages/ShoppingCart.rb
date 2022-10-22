require_relative 'BasePage'

class ShoppingCart < BasePage

  QTY_FIELD = {xpath: "//input[@title='Qty']"}
  UPD_QTY_BTN = {css: "button.button.btn-update"}
  MESSAGE_ERR_QTY = {css: ".item-msg.error"}
  EMPTY_CART_BTN = {css: "#empty_cart_button"}
  EMPTY_CART_TITLE = {css: ".page-title"}

  def change_quantity(num)
    @driver.find_element(QTY_FIELD).clear
    @driver.find_element(QTY_FIELD).send_key(num)
  end

  def click_update_qty
    @driver.find_element(UPD_QTY_BTN).click
  end

  def get_err_qty_msg_txt
    @driver.find_element(MESSAGE_ERR_QTY).text
  end

  def empty_cart
    @driver.find_element(EMPTY_CART_BTN).click
  end

  def is_cart_empty?
    @driver.find_element(EMPTY_CART_TITLE).text
  end

end
