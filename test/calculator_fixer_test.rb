# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/calculator_fixer'

# Test validator
class CalculatorFixerTest < Minitest::Test
  def test_fixer_one
    file = file_fixture('file-err-1.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '123456789', CalculatorFixer.new(scanner).call
  end

  def test_fixer_two
    file = file_fixture('file-err-2.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '345882865', CalculatorFixer.new(scanner).call
  end
end
