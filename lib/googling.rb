require "googling/version"

module Googling
  def self.check
    check = `html2text -version` rescue nil
    if check 
      puts "Fine, go next step."
      true
    else    
      puts "Please install the html2text."
      false
    end 
  end

  def self.search
    puts "Enter your search,please."
    yoursearch = gets.chomp()
    url = "curl -A Mozilla http://www.google.com/search?q=#{yoursearch} |html2text -width 70"
    answer = `curl #{url}`
    puts "#{answer}"
  end
end

if Googling.check
  puts Googling.search
end
 