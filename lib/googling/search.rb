require 'nokogiri'
require "net/http"
require 'uri'

module Googling
  class Search
    attr_reader :response, :list

    def initialize(keywords)  
      @keywords = keywords 
    end

    def execute
      make_request
      parse_results
    end

    private

    def make_request 
      uri = URI.parse("https://www.google.com/search?q=#{@keywords}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      @response = http.request(request) 
    end

    def parse_results
      page = Nokogiri::HTML(response.body)
      page.encoding = 'utf-8'

      nodes = page.css('li.g')
      nodes = nodes.select { |r| r.css('table').empty? }
      nodes.map do |r|
        title = r.css('h3 a').text
        link  = r.css('h3 a').map{|x| x['href'].to_s.sub!("/url?q=","")}
        description = r.css('div.s span.st').text
        Result.new(title: title, link: link, description: description)
      end
    end 
  end
end