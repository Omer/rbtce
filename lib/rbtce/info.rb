module Rbtce
  class Info < BaseModel
    def self.fetch( options={} )
      build( nil, Client.get( end_point, options ) )
    end

    def self.build( _, response )
      response['pairs'].map { |symbol, options|
        new( symbol, options )
      }
    end

    private

    def self.end_point
      '/info'
    end

    def required_fields
      %w{ decimal_places min_price max_price min_amount hidden fee }
    end
  end
end
