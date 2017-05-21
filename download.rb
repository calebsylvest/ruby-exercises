require 'open-uri'

download = open('http://www.oreilly.com/business/free/files/designing-culture.epub')

IO.copy_stream(download, "data/#{download.base_uri.to_s.split('/')[-1]}")
