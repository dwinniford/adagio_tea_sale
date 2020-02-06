class AdagioTeaSale::Scraper

  def self.scrape_sale_page(url)
    tea_array = []
    doc = Nokogiri::HTML(open(url))
    item_array = doc.css(".productIndexParent")
    item_array.each do |item|
      tea_hash = {}
      tea_hash[:name]= item.css("img").attribute("alt").value
      tea_hash[:url]= item.css("a").attribute("href").value
      tea_hash[:percent_off]= item.css(".circleSale div").text.to_i
      tea_array << tea_hash
    end 
    tea_array
  end 
  
  def self.scrape_tea_page(url)
    tea_hash = {}
    doc = Nokogiri::HTML(open(url))
    if  doc.css("div.price strike").text.strip.split("$").length > 2 
      tea_hash[:original_price]= doc.css("div.price strike").text.strip.split("$")[1].to_i 
    else 
       tea_hash[:original_price]= doc.css("div.price strike").text.strip.delete("$").to_i
    end 
    tea_hash[:small_quantity]= doc.css(".rollover").first.text.strip
    if doc.css("div.price").first
      tea_hash[:sale_price] = doc.css("div.price").first.text.strip.split("$").last.to_i
      if tea_hash[:small_quantity].scan("quart") # if lists number of quarts then p/(q*4)
        tea_hash[:price_per_cup] = (tea_hash[:sale_price] / (tea_hash[:small_quantity].scan(/\d/).join.to_f * 4) ).round(2)
      else 
         tea_hash[:price_per_cup] = (tea_hash[:sale_price] / tea_hash[:small_quantity].scan(/\d/).join.to_f).round(2)
      end 
    else 
      tea_hash[:sale_price] = 0 
      tea_hash[:price_per_cup] = 0 
    end 
    tea_hash[:rating] = doc.css("div.scoreSummary").text.strip.to_i
    tea_hash[:info] = doc.css("div.description").text.strip.delete("\n"+"\t"+"\r")
    tea_hash
  end 

end 