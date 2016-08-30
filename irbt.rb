# coding: utf-8
# An IRB + vls test bed

require 'irb'

puts "Starting an IRB console with vls loaded."

if ARGV[0] == 'local'
  require_relative 'lib/vls'
  puts "vls loaded locally: #{VersionLS::VERSION}"

  ARGV.shift
else
  require 'vls'
  puts "vls loaded from gem: #{VersionLS::VERSION}"
end

IRB.start
