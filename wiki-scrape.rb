require 'rubygems'
require 'crack'
require 'open-uri'
require 'rest-client'

# url='http://en.wikipedia.org/w/api.php?action=opensearch&search=At&namespace=0'

WURL = 'http://en.wikipedia.org/w/api.php?action=opensearch&namespace=0&suggest=&search='

# puts Crack::JSON.parse(RestClient.get(url))

('A'..'Z').to_a.each do |letter|
  resp = RestClient.get("#{WURL}#{letter}", 'User-Agent' => 'Ruby')
  arr = Crack::JSON.parse(resp)
  puts arr.join(', ')
  sleep 0.5
end
