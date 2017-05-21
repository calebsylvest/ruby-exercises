require 'open-uri'
require 'nokogiri'

domain = "http://www.oreilly.com/"

topics = [
  'design',
  'business',
  'data',
  # 'iot',
  # 'programming',
  # 'security',
  # 'webdev',
  # 'webops'
]

formats = [
  '.epub',
  '.mobi',
  '.pdf'
]


# Topics - loop through each topic
topics.each do |topic|

  topic_path = domain + topic + "/free/"

  puts "================================================"
  puts topic.upcase
  puts topic_path
  puts "================================================"
  puts " "
  puts " "
  puts " "
  puts " "

  document       = open(topic_path)
  content        = document.read
  parsed_content = Nokogiri::HTML(content)

  # find each book per topic page
  parsed_content.css('.cover-showcase').css('a').each do |book|
    book_title = book.css('img').first.attributes['alt'].value
    book_url   = book.attributes['href'].value
    file_url   = book_url.gsub("free", "free/files")

    puts "----------------------------------------------"
    puts "Topic: " + topic
    puts "Title: " + book_title
    puts "----------------------------------------------"

    # create download urls for each book based on common formats
    formats.each do |format|

      puts "Checking for #{format}..."

      begin
        clean_url = file_url.partition(".csp")
        download_url = clean_url[0] << (format)
        read_download = open("#{download_url}")

        puts "Format #{format} is available"
        puts "Download URL: " + download_url
        puts "Downloading..."

        IO.copy_stream(read_download, "#{read_download.base_uri.to_s.split('/')[-1]}")

        puts "👍 #{book_title}#{format} download complete"

      rescue
        puts "🚫 #{format} doesnt exist"
      end

      puts "----------------------"

    end

    puts " "
    puts " "
    puts " "
    puts " "

    delay_time = rand(11)
    sleep(delay_time)

  end
end
