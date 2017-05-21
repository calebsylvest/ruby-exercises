# CSV Importer

require 'csv'

CSV.foreach ('data/ideas.csv') do |row|
  puts row.inspect
end

# CSV.read('data/ideas.csv')
