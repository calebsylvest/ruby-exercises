require 'open-uri'
require 'nokogiri'

file = File.open('data/Steve Jobs - Wikipedia.htm')
html = Nokogiri::HTML(file)

output = File.new( 'steve-jobs-story.txt', 'w+' )

name = html.at_css('#firstHeading').text
bday = html.at_css('.bday').text
dday = html.at_css('.dday').text
cause_of_death = html.at_xpath('//a[@title="Pancreatic cancer"]').text

puts name
puts bday
puts dday
puts cause_of_death

output.write( name + ' was born on ' + bday + "\n" )
output.write( 'He died on ' + dday + ' due to ' + cause_of_death)
