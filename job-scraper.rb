require 'open-uri'
require 'nokogiri'
require 'csv'

### Buzzshift Jobs
url = "http://www.buzzshift.com/jobs"
document = open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)

CSV.open('data/jobs/buzzshift-jobs.csv', 'wb') do |csv|
  csv << ['Job', "Link"]

  parsed_content.css('.uncont').css('.panel').each do |p|
    title = p.css('.panel-title').css('span').inner_text
    id    = p.css('.panel-collapse').first.attributes['id'].value
    link  = url + "#" + id

    title.slice! " | Dallas, TX"

    puts title
    puts link

    csv << [title, link]
    puts "Buzzshift job written to the csv file"
    puts "-------------------------------"
  end
end


### Capital One Jobs
base_url = "https://www.capitalonecareers.com"
jobs_url = "https://www.capitalonecareers.com/search-jobs/Dallas%2C%20TX/1732/4/6252001-4736286-4684904-4684888/32x78306/-96x80667/50/2"
document = open(jobs_url)
content = document.read
parsed_content = Nokogiri::HTML(content)

CSV.open('data/jobs/capital-one-jobs.csv', 'wb') do |csv|
  csv << ['Job', "Link"]

  parsed_content.css('#search-results-list').css('ul li').each do |p|
    title = p.css('h2').inner_text
    path  = p.css('a').first.attributes['href'].value
    link  = base_url + path

    puts title
    puts link

    csv << [title, link]
    puts "Capital One job written to the csv file"
    puts "-------------------------------"
  end
end


### Imaginuity Jobs
jobs_url = "https://www.imaginuity.com/careers"
document = open(jobs_url)
content = document.read
parsed_content = Nokogiri::HTML(content)

CSV.open('data/jobs/imaginuity-jobs.csv', 'wb') do |csv|
  csv << ['Job', "Link"]

  parsed_content.css('.content').css('ul.columns li').each do |p|
    title = p.css('a').inner_text
    path  = p.css('a').first.attributes['href'].value
    link  = jobs_url + path

    title.slice! " >>"

    puts title
    puts link

    csv << [title, link]
    puts "Imaginuity job written to the csv file"
    puts "-------------------------------"
  end
end
