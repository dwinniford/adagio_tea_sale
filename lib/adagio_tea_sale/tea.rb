class AdagioTeaSale::Tea 
  attr_accessor :name, :price, :rating, :quantity, :price_per_cup, :percent_off, :info, :caffeine, :brewing, :url
  @@all = []
  
  def initialize
  @@all << self 
  end 
  
  def self.create_from_sale_page(sale_page_url)
    doc = Nokogiri::HTML(open(sale_page_url))
    binding.pry 
  end 
  
  def add_attributes
  end 
  
  def self.find_by_name
  end 
  
  def self.sort_by_price
    @@all.sort { |t| t.price }
  end 
  
  def self.sort_by_percent
    @@all.sort { |t| t.percent_off }
  end 
  
  def self.sort_by_cup
    @@all.sort { |t| t.price_per_cup }
  end 

end 