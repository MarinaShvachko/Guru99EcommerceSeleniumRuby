class CompareProductsPage < BasePage
  PAGE_HEADING = {css: ".page-title.title-buttons > h1"}
  COMP_PRODUCTS_NAMES = {css: ".product-name"}
  CLOSE_WINDOW = {xpath: "//button[@title='Close Window']"}

  def get_page_heading
    return @driver.find_element(PAGE_HEADING).text
  end

  def compared_products_names
    array_names = @driver.find_elements(COMP_PRODUCTS_NAMES)
    array_names_text = []
    array_names.each do |el|
      array_names_text.append(el.text)
    end
    return array_names_text
  end

  def close_compare_window
    @driver.find_element(CLOSE_WINDOW).click
  end

end
