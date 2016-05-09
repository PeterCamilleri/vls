# coding: utf-8

require_relative '../lib/vls'
gem              'minitest'
require          'minitest/autorun'
require          'minitest_visible'

class VLSTester < Minitest::Test

  #Track mini-test progress.
  include MinitestVisible

  def test_the_basics
    assert(VersionLS, "The module VersionLS should exist.")
  end

end
