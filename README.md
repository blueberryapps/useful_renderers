# UsefulRenderers

[![Gem Version](https://badge.fury.io/rb/useful_renderers.svg)](http://badge.fury.io/rb/useful_renderers)
[![Code Climate](https://codeclimate.com/github/blueberryapps/useful_renderers/badges/gpa.svg)](https://codeclimate.com/github/blueberryapps/useful_renderers)
[![Dependency Status](https://gemnasium.com/blueberryapps/useful_renderers.svg)](https://gemnasium.com/blueberryapps/useful_renderers)

Rails renderers

- CSV renderer for ActiveRecord collections
- ZIP renderer fo collection of File objects

Big thanks to @beerlington and his [render_csv](https://github.com/beerlington/render_csv) gem.

## Rails & Ruby Versions Supported

*Rails:* 3.0.x - 4.0.x

*Ruby:* 1.9.3, 2.0.0 and 2.1.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'useful_renderers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install useful_renderers


## What is it?

The CSV renderer allows you to render any collection as CSV data.

```ruby
class LocationsController < ApplicationController
  def index
    @locations = Location.all

    respond_to do |format|
      format.csv  { render csv: @locations }
    end
  end
end
```

Will render a CSV file similar to:

<table>
  <tr>
    <th>name</th><th>address</th><th>city</th><th>state</th><th>zip</th><th>created_at</th><th>updated_at</th>
  </tr>
  <tr>
    <td>Pete's House</td><td>555 House Ln</td><td>Burlington</td><td>VT</td><td>05401</td><td>2011-07-26 03:12:44 UTC</td><td>2011-07-26 03:12:44 UTC</td>
  </tr>
  <tr>
    <td>Sebastians's House</td><td>123 Pup St</td><td>Burlington</td><td>VT</td><td>05401</td><td>2011-07-26 03:30:44 UTC</td><td>2011-07-26 03:30:44 UTC</td>
  </tr>
  <tr>
    <td>Someone Else</td><td>999 Herp Derp</td><td>Burlington</td><td>VT</td><td>05401</td><td>2011-07-26 03:30:44 UTC</td><td>2011-07-26 03:30:44 UTC</td>
  </tr>
</table>

## Usage Options

There are a few options you can use to customize which columns are included in the CSV file

### Exclude columns

```ruby
respond_to do |format|
  format.csv  { render csv: @locations, except: [:id] }
end
```

### Limit columns

```ruby
respond_to do |format|
  format.csv  { render csv: @locations, only: [:address, :zip, 'country.state'] }
end
```

### Translate headers

Using `Class.human_attribute_name(column_name)`

```ruby
respond_to do |format|
  format.csv  { render csv: @locations, translate: true }
end
```


## Contributing

1. Fork it ( https://github.com/blueberryapps/useful_renderers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
# render_csv

Rails CSV renderer for ActiveRecord collections

## Copyright

Copyright © 2011-2014 Peter Brown. See LICENSE.txt for render_csv.
Copyright © 2014 Ondrej Bartas for implementation ZIP and updates of render_csv.
