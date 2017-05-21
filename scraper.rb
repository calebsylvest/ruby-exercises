require 'nokogiri'
require 'open-uri'

url = 'http://lycos.com'

html = open(url)

doc = Nokogiri::HTML(html)

puts doc
