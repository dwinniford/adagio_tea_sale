#has shopping cart with tea and total price

class AdagioTeaSale::User 
  attr_accessor :cart 
 
  def initialize 
    @cart = ["black tea", "green tea", "puer tea"]
  end 
  
  def add_cart(t)
    @cart << t 
  end 
  
  def remove_item(name)
    #@cart.delete { |t| t.name == name }
    @cart.delete(name)
  end 
  
  def remove_all
    @cart = []
  end 
  
  def total_price
  #sum of cart price
  end 
  
end 