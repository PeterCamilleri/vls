# coding: utf-8

require_relative "vls/version"

#An addition to the Object class for vls support.
class Object
  #Get the vls version string from this module.
  def to_vls_version_string
    "version #{self.class} ???"
  end
end

#An addition to the String class for vls support.
class String
  #Get this string as a vls version string.
  def to_vls_version_string
    self
  end
end

#An addition to the Module class for vls support.
class Module
  #Get the vls version string from this module.
  def to_vls_version_string
    self::STRING
  rescue
    "version #{self} ???"
  end
end

#An addition to the Array class for vls support.
class Array
  #Get the vls version string from this array.
  def to_vls_version_string
    (1..5) === self.length ? self.join('.') : super
  end
end

# The Version LiSt utility module.
module VersionLS
  #Execute the core of the vls command and return an array of
  #[module, version] arrays.
  def self.vls
    modules.map do |mod|
      begin
        version = mod::VERSION
      rescue
        version = 'version ???'
      end

      [mod, version.to_vls_version_string]
    end
  end

  #Get a list of modules that have VERSION info.
  def self.modules
    mods = ObjectSpace.each_object(Module).select do |mod|
      mod.const_defined?("VERSION")
    end.sort do
      |first, second| first.name <=> second.name
    end

    mods - [VersionLS]
  end
end
