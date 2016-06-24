# coding: utf-8

require_relative "vls/version"

# The Version LiSt utility module.
module VersionLS

  #Execute the core of the vls command and return an array of
  #[module, version] arrays.
  def self.vls
    modules.map do |mod|
      version = mod.const_get(:VERSION)
      version = version::STRING if version.is_a?(Module)

      [mod, version]
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
