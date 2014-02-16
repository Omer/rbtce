module Rbtce
  class Trades < BaseModel
    private

    def self.end_point
      '/trades'
    end

    def required_fields
      %w{ timestamp price amount tid type }
    end

    def date_fields
      %w{ timestamp }
    end
  end
end
