#has shopping cart with tea and total price

class AdagioTeaSale::User 
  attr_accessor :cart 
 
  def initialize 
    @cart = []
  end 
  
  def add_cart(t)
    @cart << t 
  end 
  
  def remove_item(name)
    @cart.delete { |t| t.name == name }
  end 
  
  def remove_all
    @cart = []
  end 
  
end 