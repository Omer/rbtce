module Rbtce
  module Client
    class << self
      BASE_URI = 'https://btc-e.com/api/3'

      def get( end_point, options={} )
        uri = URI.parse( [BASE_URI, end_point, parse_params( options )].join )
        http = Net::HTTP.new( uri.host, uri.port )
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new( uri.request_uri )
        response = http.request( request )
        if response.code == "200"
          JSON.parse( response.body )
        else
          raise "#{response.message} (#{response.code})"
        end
      end

      private

      def parse_params( params )
        return '' if params.empty?
        '?' + params.map { |k,v|
          "#{CGI.escape( k.to_s )}=#{CGI.escape( v.to_s )}"
        }.join( '&' )
      end
    end
  end
end
