# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/challenge'

# Test challenge
class ChallengeTest < Minitest::Test
  def test_the_file
    file = Tempfile.new
    assert_equal Challenge.new(file).call, '1234'
  end
end
