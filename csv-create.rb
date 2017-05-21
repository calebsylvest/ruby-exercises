# Create example CSV

require 'csv'

CSV.open('data/test.csv', 'wb') do |csv|
  csv << ['Stock', "Sales", "Day"]
  csv << ['10', "12", "1"]
  csv << ['188', "6", "3"]
  csv << ['133', "1", "4"]
  csv << ['18', "14", "2"]
end
