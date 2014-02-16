module Rbtce
  class BaseModel
    attr_reader :symbol

    def initialize( symbol, options )
      @symbol = symbol
      @_options = options
      required_fields.each do |field_name|
        val = options.fetch( field_name )
        val = Time.at( val ) if date_fields.include?( field_name )
        instance_variable_set( "@#{field_name}", val )
      end
    end

    def self.from( currency )
      PairBuilder.new( end_point: end_point, class: self ).from( currency )
    end

    def to_json( options={} )
      include_root = options.fetch( :include_root, false )
      include_root ? Hash[symbol, @_options].to_json : @_options.to_json
    end
    alias :to_s :to_json

    def self.build( pairs, response )
      elements = pairs.map { |pair|
        symbol = "#{pair[:from]}_#{pair[:to]}"
        symbol_element = response.fetch( symbol )
        if symbol_element.is_a?( Hash )
          new( symbol, symbol_element )
        else
          symbol_element.map { |options| new( symbol, options ) }
        end
      }
      elements.length < 2 ? elements.first : elements
    end

    private

    def self.end_point
      raise MethodNotImplemented
    end

    def required_fields
      raise MethodNotImplemented
    end

    def date_fields; []; end
  end
end
