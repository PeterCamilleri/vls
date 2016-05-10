# VersionLS

A utility for producing a list of classes/modules with version info, that are
present in an application, gem, or ruby program file.

## Installation

The vls gem is normally used as a stand-alone utility. However, its
functionality may be added to any Ruby application. To do so you can add this
line to your application's Gemfile:

```ruby
gem 'vls'
```

And then execute:

    $ bundle

Far more likely however, install it yourself as:

    $ gem install vls

The vls gem itself is found at: ( https://rubygems.org/gems/vls )

## Usage

The vls utility is normally used at the command line. The basic usage template
is:

    $ vls <names>

where names is a list of gems and/or files to be required before the
module/classes are displayed with their VERSION information. For example:

    C:\Sites\vls>vls fOOrth
    vls (VersionLS): 0.1.0

    Bignum, 0.0.5
    Complex, 0.0.5
    Date::Infinity, 0.0.5
    FalseClass, 0.0.5
    Fixnum, 0.0.5
    Float, 0.0.5
    FormatEngine, 0.7.2
    FullClone, 0.0.5
    Gem, 2.2.2
    InArray, 0.1.5
    Integer, 0.0.5
    MiniReadline, 0.4.8
    NilClass, 0.0.5
    Numeric, 0.0.5
    Rational, 0.0.5
    Regexp, 0.0.5
    RubySscanf, 0.2.1
    SafeClone, 0.0.3
    Symbol, 0.0.5
    TrueClass, 0.0.5
    XfOOrth, 0.6.1

The vls utility is also available for use within an application. It may be
accessed with:
```ruby
module_version_list = VersionLS.vls
```
This returns an array of entries, sorted by module name, consisting of an
array with the module and a string with its version.

Note that the vls method does not accept a list of modules to be required. It
is assumed that when embedded within an application, the needed facilities
would have already been loaded.

## Contributing

#### Plan A

1. Fork it ( https://github.com/PeterCamilleri/vls/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Plan B

Go to the GitHub repository and raise an issue calling attention to some
aspect that could use some TLC or a suggestion or an idea.
