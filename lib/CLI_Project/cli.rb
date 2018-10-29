class CLIProject::CLI

  def call
    CLIProject::Scraper.make_products
    puts "Welcome to the EnterAction Apparel featured product list!"
    start
  end

  def start
    puts ""
    puts "What products would you like to see? Enter 'all' for all products or 'sale' for products on sale."
    input1 = gets.strip.downcase

    print_products(input1)

    puts ""
    puts "What product would you like more information on?"
    input2 = gets.strip

    while input2.to_i > CLIProject::Product.all.size || input2.to_i < 1 do
        print_products(input1)
        puts "Please choose from one of the items listed."
        input2 = gets.strip
    end

    product = CLIProject::Product.find(input2.to_i)

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
      puts 'Not a valid input. Please choose "y" or "n".'
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
      print_selection(CLIProject::Product.find_by_sale, input)
    elsif input == 'all'
      print_selection(CLIProject::Product.all, input)
    else
      puts 'Not a valid input. Please choose "all" or "sale".'
      start
    end
  end

  def print_selection(selection, input)
    puts ""
    puts "---------- EnterAction Apparel's list of #{input} products ----------"
    puts ""
    selection.each.with_index(1) { |product, index| puts "#{index}. #{product.name}" }
  end
end
