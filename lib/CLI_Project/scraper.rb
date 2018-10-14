class CLI_Project::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.enteractionapparel.com"))
  end

  def scrape_products_index
     self.get_page.css("div.product-item__link-wrapper")
  end

  def make_products
    scrape_products_index.each do |product|
      CLI_Project::Product.new_from_index_page(product)
    end
  end
end
