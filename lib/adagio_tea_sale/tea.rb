class AdagioTeaSale::Tea 
  attr_accessor :name, :sale_price, :original_price, :large_price, :rating, :small_quantity, :large_quantity, :price_per_cup, :percent_off, :info, :caffeine, :brewing, :url
  @@all = []
  
  def initialize
  @@all << self 
  end 
  
  def self.create_from_sale_page
    doc = Nokogiri::HTML(open("https://www.adagio.com/list/sale.html"))
    item_array = doc.css(".productIndexParent")
    item_array.each do |item|
      t = AdagioTeaSale::Tea.new 
      t.name= item.css("img").attribute("alt").value
      t.url= item.css("a").attribute("href").value
      t.percent_off= item.css(".circleSale div").text.to_i
    end 
    self.add_attributes
  end 
  
  def self.add_attributes
    basepath = "https://www.adagio.com"
   # url = basepath + @@all.first.url 
  # url = "https://www.adagio.com/masters/shizuoka_shincha.html"
  # doc = Nokogiri::HTML(open(url))
    @@all.each do |t|
      url = basepath + t.url 
      doc = Nokogiri::HTML(open(url))
      t.original_price= doc.css("div.price strike").text.strip.delete("$").to_i
      if doc.css("div.price").first
        t.sale_price = doc.css("div.price").first.text.strip.split("$").last.to_i
      end 
      t.small_quantity= doc.css(".rollover").first.text.strip
      t.rating = doc.css("div.scoreSummary").text.strip.to_i
      t.info = doc.css("div.description").text.strip
    end  
    binding.pry 
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

# doc.css(".productIndexParent")

# item_array = doc.css(".productIndexParent")
# item_array.first.css("img")
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

# @name="shizuoka shincha",
#   @original_price=0,
#   @percent_off=0,
#   @rating=95,
#   @small_quantity="returning end of Apr",
#   @url="/masters/shizuoka_shincha.html">,


