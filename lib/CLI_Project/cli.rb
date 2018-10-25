class CLIProject::CLI

  def call
    CLIProject::Scraper.make_products
    puts "Welcome to the EnterAction Apparel featured product list!"
    binding.pry
    start
  end

  def start
    puts ""
    puts "What products would you like to see? Enter 'all' for all products or 'sale' for products on sale."
    input = gets.strip

    print_products(input)

    puts ""
    puts "What product would you like more information on?"
    input = gets.strip

    product = CLIProject::Product.find(input.to_i)

    CLIProject::Scraper.add_product_details(product) if product.price == nil

    print_product(product)

    puts ""
    puts "Would you like to see another product? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Be sure to check back in later for more amazing products and sales!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

  def print_product(product)
    puts ""
    puts "----------- #{product.name} -----------"
    puts ""
    puts "Regular Price:   #{product.price}"
    puts "Sales Price:     #{product.sale_price}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{product.description}"
    puts ""
  end

  def print_products(input)
    if input == 'sale'
      puts ""
      puts "---------- EnterAction Apparel's list of #{input} products ----------"
      puts ""
        CLIProject::Product.all.each.with_index(1) do |product, index|
          if product.on_sale != ""
            puts "#{index}. #{product.name}"
          end
        end
      elsif input == 'all'
        puts ""
        puts "---------- EnterAction Apparel's list of #{input} products ----------"
        puts ""
          CLIProject::Product.all.each.with_index(1) do |product, index|
            puts "#{index}. #{product.name}"
          end
      else
        puts "Not valid input"
        start
     end
  end

end
