require 'nokogiri'
require 'open-uri'
require "net/http"
require 'uri'
require 'pry'

puts "Enter a word."
ans = gets.chomp()

uri = URI.parse("https://www.google.com?q=#{ans}")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)
#binding.pry會使程式在此停止, 然後可得以上所有資訊
binding.pry
puts response.code
# => 301
puts response["location"] # All headers are lowercase
# => http://www.google.com/

puts response.body


doc = Nokogiri::HTML(open('response["location"]'))
 doc.xpath('//h3/a').each do |node|
      puts node.text
    end