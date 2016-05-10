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
    assert_equal(String, VersionLS::VERSION.class)
  end

  def test_that_it_can_find_modules
    assert_equal(Array, VersionLS.modules.class)

    refute(VersionLS.modules.include?(VersionLS))
    assert(VersionLS.modules.include?(Gem))
  end

  def test_that_it_can_find_versions_too
    assert(VersionLS.vls)
  end
end
