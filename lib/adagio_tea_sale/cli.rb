#require_relative "../lib/tea.rb"
#require_relative "../lib/user.rb"
#require_relative "../lib/scraper.rb"
#require "nokogiri"

class AdagioTeaSale::CLI 
  
  def initialize
    #call scraper to create instances of Tea
  end 
  
  def call
    puts "Welcome to Adagio Tea."
    list_sales
    menu
  end 
  
  def list_sales
    puts "Here are today's sales:"
    #print_tea(Tea.all)
    puts "1. Black tea"
    puts "2. Green tea"
  end 
  
  def print_tea(tea_array)
    tea_array.each do |t|
      puts "Name: #{t.name}, Price: #{t.price}"
    end 
  end 
  
  def menu 
    loop do 
    puts "Choose an option:"
    puts "To select a tea for more information, enter 'select'."
    puts "To sort tea by price, enter 'sort price'."
    puts "To sort tea by percent off, enter 'sort percent'."
    puts "To sort tea by price per cup, enter 'sort cup'."
    puts "To view your shopping cart, enter 'view cart'."
    # puts "To add a tea to shopping cart, enter 'add cart'."  only give this option on the tea info menu.
    puts "To exit, enter 'exit'."
    input = gets.strip 
    case input
      when 'select'
        select_tea
      when 'sort price'
        sort_by_price
      when 'sort percent'
        sort_by_percent
      when 'sort cup'
        sort_by_cup
      when 'view cart'
        view_cart
      when 'exit'
        exit 
      end 
    end 
  end 
  
  def select_tea
    puts "Please enter the name of a tea:"
    # input = gets.strip
    # t = Tea.find_by_name(input)
    # puts "Name: #{t.name}" 
    # puts "Rating: #{t.rating}" 
    # puts "Quantity: #{t.quantity}" 
    # puts "Price: #{t.price}" 
    # puts "Price per cup: #{t.price_per_cup}"
    # puts "Percent off: #{to.percent off}" 
    # puts "More info: #{t.info}"
    # puts "Caffeine: #{t.caffeine}"
    # puts "Brewing instructions: #{t.brewing}"
    puts "To add this tea to your shopping cart, enter 'add_cart'."
    puts "To see main menu, enter 'menu'."
    input = gets.strip
    if input == "add_cart"
     # current_user.add_to_cart(t)
      puts "Added_to_cart"
    elsif input == "menu"
      menu 
    end 
  end 
  
  def print_tea_info
  end 
  
  def sort_by_price
    #print_tea(Tea.sort_by_price)
    puts "Tea sorted by price..."
  end 
  
  def sort_by_percent
   # print_tea(Tea.sort_by_percent)
    puts "Tea sorted by percent..."
  end 
  
  def sort_by_cup
    #print_tea(Tea.sort_by_cup)
    puts "Tea sorted by price per cup..."
  end 
  
  def view_cart
    # if current_user.cart.length == 0 
    #   puts "Your cart is empty."
    # else 
    #   print_tea(current_user.cart)
    # end 
    puts "Items in your cart..."
    puts "To remove an item, enter 'remove item'."
    puts "To remove all items, enter 'remove all'."
    puts "To select a tea for more information, enter 'select'."
    puts "To view the main menu, enter 'menu'."
    input = gets.strip
    case input 
      # when "remove item"
      #   remove_item
      # when "remove_all"
      #   remove_all
      when "select"
        select_tea
      when "menu"
        menu 
    end 
  end 
  
    
end 







