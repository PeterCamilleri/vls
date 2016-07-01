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
    assert_equal(String, VersionLS::STRING.class)
    assert_equal(String, VersionLS::DESCRIPTION.class)
  end

  def test_that_it_can_find_modules
    assert_equal(Array, VersionLS.modules(/./).class)

    refute(VersionLS.modules(/./).include?(VersionLS))
    assert(VersionLS.modules(/./).include?(Gem))
  end

  def test_that_it_can_find_modules_filtered
    module_list = VersionLS.modules('Gem')
    assert_equal(1, module_list.length)
    assert(VersionLS.modules('Gem').include?(Gem))

    module_list = VersionLS.modules(/^Gem$/)
    assert_equal(1, module_list.length)
    assert(VersionLS.modules('Gem').include?(Gem))
  end

  def test_that_it_can_find_versions_too
    assert(VersionLS.vls)
  end

  def test_that_modules_become_versions
    assert_equal(VersionLS::STRING, VersionLS.to_vls_version_string)
  end

  def test_that_arrays_become_versions
    assert_equal("1.2.3", [1,2,3].to_vls_version_string)
  end

  def test_for_failure_cases
    assert_equal("version VLSTester ???", VLSTester.to_vls_version_string)
    assert_equal("version Array ???", [].to_vls_version_string)
    assert_equal("version Array ???", [1,2,3,4,5,6].to_vls_version_string)
  end
end
