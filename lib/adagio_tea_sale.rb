require 'pry'
require 'nokogiri'
require 'open-uri'
require 'require_all'

require_relative "./adagio_tea_sale/version"
require_relative "./adagio_tea_sale/cli"
require_relative "./adagio_tea_sale/scraper"
require_relative "./adagio_tea_sale/tea"
require_relative "./adagio_tea_sale/user"

module AdagioTeaSale
  class Error < StandardError; end
  # Your code goes here...
end

