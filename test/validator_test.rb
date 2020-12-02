# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/validator'

# Test validator
class ValidatorTest < Minitest::Test
  def test_valid_number
    assert_equal true, Validator.new('345882865').valid?
  end

  def test_invalid_number
    assert_equal false, Validator.new('345882866').valid?
  end
end
