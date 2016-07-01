# coding: utf-8

#An addition to the Object class for vls support.
class Object
  #Get the vls version string from this module.
  def to_vls_version_string
    "version #{self.class} ???"
  end

  #A simple shortcut method for ease of use in irb and rails console.
  def vls(filter=/./)
    VersionLS.ls(filter)
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
