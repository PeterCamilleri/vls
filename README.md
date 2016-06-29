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
array with the module and a string with its version. Also, the Object class
is monkey patched with the vls method that outputs the information to the
console.

```ruby
vls
```

Note that these methods do not accept a list of modules to be required. It
is assumed that when embedded within an application, the needed facilities
would have already been loaded. In addition, the vls listing to the console
has no header information. If this is desired, the application should do a
puts of the appropriate descriptive text.

## The Rails Console

If the vls gem has been added to a rails project (in its Gemfile), its
functionality is also easily accessed via the rails console:

    $ rails console

followed by

```ruby
vls
```

will create a formatted listing of the modules with version info of the module
load out of the web site. For example:

    $ rails console
    Loading development environment (Rails 4.2.6)
    irb(main):001:0> vls
    ActionDispatch::Journey::Router, 2.0.0
    ActionMailer, 4.2.6
    ActionPack, 4.2.6
    ActionView, 4.2.6
    ActiveJob, 4.2.6
    ActiveModel, 4.2.6
    ActiveRecord, 4.2.6
    ActiveSupport, 4.2.6
    ActiveSupport::Logger, 1.2.7
    Arel, 6.0.3
    Bundler, 1.11.2
    Coffee::Rails, 4.1.1
    Concurrent, 1.0.1
    Erubis, 2.7.0
    ExecJS, 2.6.0
    Gem, 2.2.2
    I18n, 0.7.0
    IRB::ReadlineInputMethod, 5.2
    JSON, 1.8.3
    Jquery::Rails, 4.1.1
    Logger, 1.2.7
    Loofah, 2.0.3
    MIME::Type, 2.99.1
    MIME::Types, 2.99.1
    MIME::Types::WarnLogger, 1.2.7
    Mail, 2.6.3
    MultiJson, 1.11.2
    Nokogiri, 1.6.7.2
    OpenSSL, 1.1.0
    PG, 0.18.4
    Psych, 2.0.5
    Rack, 1.3
    Rack::Test, 0.6.3
    Rails, 4.2.6
    Rails::Html::FullSanitizer, 1.0.3
    Rails::Html::LinkSanitizer, 1.0.3
    Rails::Html::Sanitizer, 1.0.3
    Rails::Html::WhiteListSanitizer, 1.0.3
    Readline, 5.2
    Sass, 3.4.21 (Selective Steve)
    Sass::Rails, 5.0.4
    Sprockets, 3.5.2
    Sprockets::Cache, 3.0
    Sprockets::ClosureCompressor, 1
    Sprockets::CoffeeScriptProcessor, 1
    Sprockets::DirectiveProcessor, 1
    Sprockets::EcoProcessor, 1
    Sprockets::EjsProcessor, 1
    Sprockets::Rails, 3.0.4
    Sprockets::SassCompressor, 1
    Sprockets::UglifierCompressor, 1
    Sprockets::YUICompressor, 1
    TZInfo::Data, 1.2016.2
    ThreadSafe, 0.3.5
    Tilt, 2.0.2
    Turbolinks, 2.5.3
    URI, 0.9.11
    URI::FTP, 0.9.11
    URI::GID, 0.9.11
    URI::Generic, 0.9.11
    URI::HTTP, 0.9.11
    URI::HTTPS, 0.9.11
    URI::LDAP, 0.9.11
    URI::LDAPS, 0.9.11
    URI::MailTo, 0.9.11
    Uglifier, 2.7.2
    Zlib, 0.6.0
    => nil
    irb(main):002:0>

## Usage in Rails Views

It is also possible to incorporate vls data into a view using the VersionLS.vls
method in a controller and passing the resultant array of data to a view for
rendering in a web page. This may be useful for a diagnostic or informational
page in a web site. However, a detailed examination of this task is beyond the
scope of this document and readers are advised to consult Ruby on Rails
tutorials for more information.

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
