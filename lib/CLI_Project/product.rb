class CLIProject::Product

  attr_accessor :name, :url, :price, :sale_price, :description, :on_sale

  @@all = []

  def initialize(name=nil, url=nil, on_sale=nil)
    @name = name
    @url = url
    @on_sale = on_sale
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_sale
    @@all.select {|product| product.on_sale != ""}
  end
end
