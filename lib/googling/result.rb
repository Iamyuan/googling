module Googling
  class Result
    attr_reader :title, :link, :description

    def initialize(attributes = {})
      @title = attributes[:title]
      @link = attributes[:link]
      @description = attributes[:description]
    end
  end
end