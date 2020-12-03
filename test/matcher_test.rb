# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/matcher'

# Test matcher
class MatcherTest < Minitest::Test
  def test_incomplete_number
    assert_equal ['4'], Matcher.new('   |_   |').call
  end

  def test_none_number
    assert_equal [], Matcher.new('   |_    ').call
  end
end
