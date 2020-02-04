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
    #Tea.all.each...puts... or is this a resposibility of the tea class?
    puts "1. Black tea"
    puts "2. Green tea"
  end 
  
  def menu 
    loop do 
    puts "Choose an option:"
    puts "To select a tea for more information, enter 'select'."
    puts "To sort tea by price, enter 'sort price'."
    puts "To sort tea by percent off, enter 'sort percent'."
    puts "To sort tea by price per cup, enter 'sort cup'."
    puts "To add a tea to shopping cart, enter 'add cart'."
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
      when 'add cart'
        add_to_cart
      when 'exit'
        exit 
      end 
    end 
    
  
  end 
    
end 