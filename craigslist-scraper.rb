# Craigslist Job Scraper

require 'open-uri'
require 'nokogiri'

cities = ['dallas', 'newyork', 'sfbay', 'seattle', 'miami']
search_terms = ['web', 'wordpress', 'java', 'ios']

cities.each do |city|
  search_terms.each do |search_term|

    url = "https://#{city}.craigslist.org/search/sof?query=#{search_term}"

    document = open(url)
    content = document.read
    parsed_content = Nokogiri::HTML(content)

    puts "==================================================="
    puts "-"
    puts "-  #{city} - #{search_term}"
    puts "-"
    puts "==================================================="

    parsed_content.css('.content').css('.result-row').each do |row|
      title        = row.css('.hdrlnk').inner_text
      link         = row.css('.hdrlnk').first.attributes['href'].value
      posted_at    = row.css('time').first.attributes['datetime'].value
      neighb_elem  = row.css('.result-hood')

      if neighb_elem.any?
        neighborhood = neighb_elem.inner_text.strip
      else
        neighborhood = ''
      end

      puts "#{title} #{neighborhood}"
      puts "Link: #{link}"
      puts "Posted at #{posted_at}"
      puts "---------------------------------"
    end

  end
end
