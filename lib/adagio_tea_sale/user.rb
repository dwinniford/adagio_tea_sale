#has shopping cart with tea and total price

class AdagioTeaSale::User 
  attr_accessor :cart 
 
  def initialize 
    @cart = []
  end 
  
  def add_cart(t)
    @cart << t 
  end 
  
  def remove_item(input)
    @cart.delete_if { |t| t.name == input }
  end 
  
  def remove_all
    @cart = []
  end 
  
  def total_price
  #sum of cart price
  end 
  
end 