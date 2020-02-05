#has shopping cart with tea and total price

class AdagioTeaSale::User 
  attr_accessor :cart 
  def initialize 
    @cart = []
  end 
end 