# not working

require 'couchrest'

server = CouchRest.new

db = server.database!('heyspacetime')

doc = db.get('1')

puts doc.inspect
