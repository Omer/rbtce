module Rbtce
  class PairBuilder
    VALID_PAIRS = [
      { from: Currency::BTC, to: Currency::USD },
      { from: Currency::BTC, to: Currency::EUR },
      { from: Currency::BTC, to: Currency::RUR },
      { from: Currency::EUR, to: Currency::USD },
      { from: Currency::FTC, to: Currency::BTC },
      { from: Currency::LTC, to: Currency::BTC },
      { from: Currency::LTC, to: Currency::EUR },
      { from: Currency::LTC, to: Currency::RUR },
      { from: Currency::LTC, to: Currency::USD },
      { from: Currency::NMC, to: Currency::BTC },
      { from: Currency::NMC, to: Currency::USD },
      { from: Currency::NVC, to: Currency::BTC },
      { from: Currency::NVC, to: Currency::USD },
      { from: Currency::PPC, to: Currency::BTC },
      { from: Currency::PPC, to: Currency::USD },
      { from: Currency::TRC, to: Currency::BTC },
      { from: Currency::USD, to: Currency::RUR },
      { from: Currency::XPM, to: Currency::BTC },
    ]

    def initialize( options )
      @end_point = options.fetch( :end_point )
      @target_class = options.fetch( :class )
      @pairs = []
      reset_current_pair
    end

    def from( currency )
      @current_pair[:from] = currency
      self
    end

    def to( currency )
      @current_pair[:to] = currency
      self
    end

    def and( options={} )
      return self if @pairs.include?( @current_pair )
      validate_pair!( @current_pair ) if options.fetch( :validate, true )
      @pairs << @current_pair
      reset_current_pair
      self
    end
    alias :flash_pair :and

    def fetch( options={} )
      flash_pair
      @target_class.build( @pairs, Client.get( "#{@end_point}/#{pairs_path}", options ) )
    end

    private

    def reset_current_pair
      @current_pair = { from: nil, to: nil }
    end

    def validate_pair!( pair )
      raise "Invalid pair: '#{pair.inspect}'" unless VALID_PAIRS.include?( pair )
    end

    def pairs_path
      @pairs.map { |pair| "#{pair[:from]}_#{pair[:to]}" }.join( '-' )
    end
  end
end
