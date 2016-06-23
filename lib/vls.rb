# coding: utf-8

require_relative "vls/version"

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
    mods = ObjectSpace.each_object(Module).select do
      |c| c.const_defined?("VERSION")
    end.sort { |a,b| a.name <=> b.name }

    mods - [VersionLS]
  end

end
