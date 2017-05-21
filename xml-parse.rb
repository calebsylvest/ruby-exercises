require 'nokogiri'

f = File.open('data/sample.xml')
doc = Nokogiri::XML(f)
f.close
print doc
