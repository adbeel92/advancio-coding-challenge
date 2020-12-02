# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/app'

# Test app
class AppTest < Minitest::Test
  def test
    assert_equal '1234', App.new.call
  end
end
