# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/reporter_data'

# Test reporter
class ReporterDataTest < Minitest::Test
  def test_illegal
    assert_equal '3458828?5 ILL', ReporterData.new('3458828A5').call
  end

  def test_error
    assert_equal '345882869 ERR', ReporterData.new('345882869').call
  end

  def test_success
    assert_equal '345882865', ReporterData.new('345882865').call
  end
end
