require 'nokogiri'
require 'open-uri'
require "net/http"
require 'uri'
require 'pry'
require 'rubygems'

puts "Enter a word."
ans = gets.chomp()

uri = URI.parse("https://www.google.com/search?q=#{ans}")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)
#binding.pry會使程式在此停止, 然後可得以上所有資訊
#binding.pry
puts response.code
# => 301
puts response['location'] # All headers are lowercase
# => http://www.google.com/
puts response.message 
#=>ok
#puts response.class.name
#=>HTTPOK
puts response.body

page = Nokogiri::HTML(response.body)
news_links = page.css('h3.r a')
news_links.each{|link| puts link['href'] }
#binding.pry