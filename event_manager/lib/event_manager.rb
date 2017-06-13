require "erb"
require "csv"
require "sunlight/congress"
require "date"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone_number(phone)
  if phone.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
    [$1, $2, $3].join("-")
  end
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."
puts "---------------------------------"
puts "---------------------------------"

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|

  id = row[0]
  registration_date = row[:regdate]
  first_name = row[:first_name]
  last_name  = row[:last_name]
  email_address = row[:email_address]
  phone = clean_phone_number(row[:homephone])
  street = row[:street]
  city = row[:city]
  state = row[:state]
  zipcode = clean_zipcode(row[:zipcode])

  hour_of_day = registration_date[-5..-4]

  legislators = legislators_by_zipcode(zipcode)

  puts "#{id}"
  puts "#{registration_date}"
  puts "#{hour_of_day}"
  puts "#{first_name} #{last_name}"
  puts "#{email_address}"
  puts "#{phone}"
  puts "#{street}"
  puts "#{city}, #{state} #{zipcode}"
  puts "------------"

  # form_letter = erb_template.result(binding)
  #
  # save_thank_you_letters(id, form_letter)

end
