# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/reporter'

# Test reporter
class ReporterTest < Minitest::Test
  def test_illegal
    reporter = Reporter.new('3458828A5')
    reporter.call
    file = File.open(reporter.report_file.path, 'r')
    assert_equal "3458828?5 ILL\n", file.read
  end

  def test_error
    reporter = Reporter.new('345882869')
    reporter.call
    file = File.open(reporter.report_file.path, 'r')
    assert_equal "345882869 ERR\n", file.read
  end

  def test_success
    reporter = Reporter.new('345882865')
    reporter.call
    file = File.open(reporter.report_file.path, 'r')
    assert_equal "345882865\n", file.read
  end
end
