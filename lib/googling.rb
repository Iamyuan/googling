require 'googling/search'
require 'googling/result'

module Googling

  def self.search(keywords)
    Googling::Search.new(keywords).execute
  end
end 