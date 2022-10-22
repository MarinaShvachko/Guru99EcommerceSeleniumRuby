require_relative 'BasePage'

class ProductDetailPage < BasePage

  PRICE = {css: ".price"}
  QTY_FIELD = {css: ".input-text.qty"}

  def product_price
    @driver.find_element(PRICE).text
  end

end
