module Rbtce
  class Depth < BaseModel
    private

    def self.end_point
      '/depth'
    end

    def required_fields
      %w{ asks bids }
    end
  end
end
