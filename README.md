# Height

Convert height between metric and imperial systems. The main target of this gem are apps that have to dela with human's height.

## Installation

Add this line to your application's Gemfile:

    gem 'height'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install height

## Usage
```ruby
@height = Height.new(191)

@height.millimeters # 1910
@height.centimeters # 191
@height.meters # 1.91
@height.feet # 6.25
@height.inches # 75

@height.to_s(:default, :metric) # '1m 91cm'
@height.to_s(:default, :imperial) # '6 ft 3 in'
```

### I18n & Formats
The `to_s` method takes 2 optional arguments: `:format` and `:system_of_units`.

You can have as many formats as you like, add them into your locale file:
```yaml
en:
  height:
    format:
      metric:
        default: '%{meters}m %{centimeters}cm'
        only_meters: '%{only_meters}m'
        only_centimeters: '%{only_centimeters}cm'
```
You can now call:

```ruby
@height = Height.new(191)
@height.to_s(:default) # '1m 91cm'
@height.to_s(:only_meters) # '1.91m'
@height.to_s(:only_centimeters) # '191cm'
```
Same goes for the imperial system (`:only_feet`, `:only_inches`, etc).

### System of units
You can specify which system of units(`metric` or `imperial`) you want when calling `to_s`:

```ruby
Height.new(191).to_s(:default, :metric) # '1m 91cm'
Height.new(191).to_s(:default, :imperial) # '6 ft 3 in'
```

If you don't want to specify it every time you call `to_s`, you set it globally:
```ruby
Height.system_of_units = :imperial

Height.new(191).to_s # '6 ft 3 in'
```
By default, `system_of_units` is `:metric`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
