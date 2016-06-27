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

    $ vls rails
    vls (VersionLS): 0.3.0

    ActionPack, 4.2.6
    ActiveSupport, 4.2.6
    ActiveSupport::Logger, 1.2.7
    Gem, 2.2.2
    I18n, 0.7.0
    JSON, 1.8.3
    Logger, 1.2.7
    OpenSSL, 1.1.0
    Psych, 2.0.5
    Rack, [1, 3]
    Rails, 4.2.6
    ThreadSafe, 0.3.5

In order to use relative paths instead of the gem search path, the .rb extension
needs to be specified on the target file.

    $ vls ruby_sscanf.rb
    vls (VersionLS): 0.3.0

    FormatEngine, 0.7.2
    Gem, 2.2.2
    RubySscanf, 0.2.3

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

## The Rails Console

If the vls gem has been added to a rails project, its functionality is also
easily accessed via the rails console:

    rails console

followed by

```ruby
VersionLS.ls
```

will create a formatted listing of the modules with version info of the module
load out of the web site.


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
