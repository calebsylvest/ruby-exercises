require 'json'

file = File.read('data/sample.json')
data_hash = JSON.parse(file)

print data_hash.keys
print "\n"
print data_hash['colorsArray']
