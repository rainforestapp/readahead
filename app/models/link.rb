require 'rest_client'

class Link < ActiveRecord::Base
  validates :url, presence: true, url: true

  def representation
    @representation ||= Representation.new(url)
  end

  class Representation
    attr_reader :data
    delegate :title, :word_count, to: :data

    def initialize(url)
      raise "No Readability API key set" unless READABILITY_API_KEY
      @data = RestClient.get "http://www.readability.com/api/content/v1/parser?url=#{url}&token=#{READABILITY_API_KEY}"
    end
  end
end
