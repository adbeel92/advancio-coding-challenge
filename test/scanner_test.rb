# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/scanner'

# Test scanner
class ScannerTest < Minitest::Test
  def test_the_file_one
    file = file_fixture('file-1.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '123456789', scanner.number
  end

  def test_the_file_two
    file = file_fixture('file-2.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '345882865', scanner.number
  end
end
