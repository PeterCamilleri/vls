# coding: utf-8

require_relative "vls/monkey_patch"
require_relative "vls/version"

# The Version LiSt utility module.
module VersionLS
  #Perform a Versioned LiSt to the console.
  #<br>Parameters
  #* filter - a string or regex used to filter the list of modules.
  def self.print_vls(filter)
    vls(filter).each{|mod| puts "#{mod[0]}, #{mod[1]}"}
    nil
  end

  #Execute the core of the vls command and return an array of
  #[module, version] arrays.
  #<br>Parameters
  #* filter - a string or regex used to filter the list of modules.
  def self.vls(filter=/./)
    modules(filter).map do |mod|
      begin
        version = mod::VERSION
      rescue
        version = 'version ???'
      end

      [mod, version.to_vls_version_string]
    end
  end

  #Get a list of modules that have VERSION info.
  #<br>Parameters
  #* filter - a string or regex used to filter the list of modules.
  #<br>Returns
  #* An array of module objects.
  def self.modules(filter)
    regex = Regexp.new(filter)

    ObjectSpace.each_object(Module)
      .select {|mod| mod.const_defined?("VERSION") && mod.name =~ regex}
      .sort {|first, second| first.name <=> second.name}
  end
end
