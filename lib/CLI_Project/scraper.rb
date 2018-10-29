class CLIProject::Scraper

  def self.get_page
    Nokogiri::HTML(open("https://www.enteractionapparel.com"))
  end

  def self.scrape_products_index
     self.get_page.css("div.product-item__link-wrapper")
  end

  def self.make_products
    self.scrape_products_index.each { |product| self.new_from_index_page(product) }
  end

  def self.new_from_index_page(product)
      CLIProject::Product.new(
      product.css("p.product-item__title").text,
      "https://www.enteractionapparel.com#{product.css("a").attribute("href").text}",
      product.css("span.product-item__price--sale").text
      )
  end

  def self.add_product_details(product)
    doc = Nokogiri::HTML(open(product.url))
    product.price = doc.css("span.product__price--reg").text.strip
    product.description = doc.css("div.product-single__description").text.strip
    product.sale_price = doc.css("span.js-price").text.strip
  end
end
