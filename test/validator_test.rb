# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/validator'

# Test validator
class ValidatorTest < Minitest::Test
  def test_number
    assert_equal true, Validator.new('345882865').valid?
  end
end
