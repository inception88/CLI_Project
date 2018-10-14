class CLI_Project::Product

  attr_accessor :name, :url, :price, :sale_price, :description

  @@all = []

    self.new(
      product.css("p.product-item__title").text,
      "https://www.enteractionapparel.com#{product.css("a").attribute("href").text}",
      )
  end

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def price
    @price ||= doc.css("span.product__price--reg on-sale").text
  end

  def sale_price
    @sale_price ||= doc.css("span.js-price").text
  end

  def description
    @description ||= doc.css("div.product-single__description rte").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
