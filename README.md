# Rbtce

Learn about the BTC-e API at
[https://btc-e.com/api/3/documentation](https://btc-e.com/api/3/documentation).

## Installation

    gem install rbtce

## Usage

Note that for the time being only the public API is avaliable in v3.

### Info Endpoint

```ruby
require 'btce'

Rbtce::Info.fetch
```

### Ticker Endpoint

```ruby
require 'btce'

Rbtce::Ticker.from( Rbtce::Currency::LTC ).to( Rbtce::Currency::BTC ).
  and.from( Rbtce::Currency::LTC ).to( Rbtce::Currency::USD ).
  fetch
```

### Trades Endpoint

```ruby
require 'btce'

Rbtce::Trades.from( Rbtce::Currency::LTC ).to( Rbtce::Currency::BTC ).
  fetch( limit: 2000 )
```

### Depth Endpoint

```ruby
require 'btce'

Rbtce::Depth.from( Rbtce::Currency::LTC ).to( Rbtce::Currency::BTC ).fetch
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Donate

**BTC:** 1J6urRH6xbMYUdk6shTshrjtRu3PbhupRk
**LTC:** LX7nFCTEsygsEXpx4k2TAupiJMgrZqsrUr
**XDG:** DUPGsYEMBsWrYzPxbjyu4mQ7ujhAZj58mu
