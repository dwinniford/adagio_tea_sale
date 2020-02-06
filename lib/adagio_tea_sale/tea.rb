class AdagioTeaSale::Tea 
  attr_accessor :name, :sale_price, :original_price, :large_price, :rating, :small_quantity, :large_quantity, :price_per_cup, :percent_off, :info, :caffeine, :brewing, :url
  @@all = []
  
  def initialize
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def self.create_from_tea_array(tea_array)
      tea_array.each do |item_hash|
      t = AdagioTeaSale::Tea.new 
      t.name= item_hash[:name]
      t.url= item_hash[:url]
      t.percent_off= item_hash[:percent_off]
    end 
  end 
  
  def add_attributes(attribute_hash)
    attribute_hash.each do |k,v| 
      self.send("#{k.to_s}=", v)
    end 
  end 
  
  def self.find_by_name(name)
    self.all.detect { |t| t.name == name }
  end 
  
  def self.sort_by_price
    @@all.sort { |a, b| a.sale_price <=> b.sale_price }
  end 
  
  def self.sort_by_percent
    @@all.sort { |a, b| b.percent_off <=> a.percent_off }
  end 
  
  def self.sort_by_cup
    @@all.sort { |a, b| a.price_per_cup <=> b.price_per_cup }
  end 

end 



# item_array = doc.css(".productIndexParent")
# tea name = item_array.first.css("img").attribute("alt").value
# relative_url = item_array.first.css("a").attribute("href").value
# percent_off = item_array.first.css(".circleSale div").text

# original_price = doc.css("div.price strike").text.strip.delete("$").to_i   
# sale_price = doc.css("div.price").first.text.strip.split("$").last.to_i 
# large_price = doc.css("div.price").last.text.strip
# rating = doc.css("div.scoreSummary").text.strip.to_i
# small_quantity = doc.css(".rollover").first.text.strip
# large_quantity = doc.css(".rollover").last.text.strip
# info = doc.css("div.description").text.strip
# caffeine = doc.css("div.steepingInfo").text.split("|").first.strip
# brewing = doc.css("div.steepingInfo").text.split("|").last.strip
# add if statement for caffeine and brewing

#why did ti kuan yin text info also include brewing and caffeine? include a gsub for \n \t \r and leave it info 
# yunnan puer white original_price says 1249 because large_quantity also is strike through. add .first?
# ^ same problem with ice teas 

# t.original_price= doc.css("div.price strike").first.text.strip.delete("$").to_i
# or 
# t.original_price= doc.css("div.price strike").text.strip.split("$")[-2].to_i 
# or 
#  if  doc.css("div.price strike").text.strip.split("$").length > 2 
#     t.original_price= doc.css("div.price strike").text.strip.split("$")[1].to_i 
# else 

# @name="shizuoka shincha",
#   @original_price=0,
#   @percent_off=0,
#   @rating=95,
#   @small_quantity="returning end of Apr",
#   @url="/masters/shizuoka_shincha.html">,

#sale_price needs if statement for sold out products


