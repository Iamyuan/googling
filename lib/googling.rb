require 'googling/search'
require 'googling/result'

module Googling

  def self.search(keywords)
    Googling::Search.new(keywords).execute
  end
end 

puts "please enter the KEY WORDS."
keywords = gets.chomp('')  

results = Googling.search(keywords)
results.each do |result|
  puts ">>>> "
  puts result.title
  puts result.link
  puts result.description
end
