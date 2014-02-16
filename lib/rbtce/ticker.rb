module Rbtce
  class Ticker < BaseModel
    private

    def self.end_point
      '/ticker'
    end

    def required_fields
      %w{ high low avg vol vol_cur last buy sell updated }
    end

    def date_fields
      %w{ updated }
    end
  end
end
