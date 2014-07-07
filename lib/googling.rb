require "net/http"
require "uri"
require 'pry'
puts "Enter a word."
ans = gets.chomp()

uri = URI.parse("https://www.google.com?q=#{ans}")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)
binding.pry
puts response.code
# => 301
puts response["location"] # All headers are lowercase
# => http://www.google.com/

puts response.body