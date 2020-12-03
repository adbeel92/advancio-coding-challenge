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

  def test_the_file_error_one
    file = file_fixture('file-err-1.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '123456788', scanner.number
  end

  def test_the_file_error_two
    file = file_fixture('file-err-2.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '345882866', scanner.number
  end

  def test_the_file_illegal_one
    file = file_fixture('file-ill-1.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '12345678?', scanner.number
  end

  def test_the_file_illegal_two
    file = file_fixture('file-ill-2.txt')
    scanner = Scanner.new(file.read)
    scanner.call
    assert_equal '34588286?', scanner.number
  end

  def test_the_file_one_fixing
    file = file_fixture('file-1.txt')
    scanner = Scanner.new(file.read, fixing: true)
    scanner.call
    assert_equal '123456789', scanner.number
  end

  def test_the_file_two_fixing
    file = file_fixture('file-2.txt')
    scanner = Scanner.new(file.read, fixing: true)
    scanner.call
    assert_equal '345882865', scanner.number
  end

  def test_the_file_error_one_fixing
    file = file_fixture('file-err-1.txt')
    scanner = Scanner.new(file.read, fixing: true)
    scanner.call
    assert_equal '123456788', scanner.number
  end

  def test_the_file_error_two_fixing
    file = file_fixture('file-err-2.txt')
    scanner = Scanner.new(file.read, fixing: true)
    scanner.call
    assert_equal '345882866', scanner.number
  end

  def test_the_file_illegal_one_fixing
    file = file_fixture('file-ill-1.txt')
    scanner = Scanner.new(file.read, fixing: true)
    scanner.call
    assert_equal '123456789', scanner.number
  end

  def test_the_file_illegal_two_fixing
    file = file_fixture('file-ill-2.txt')
    scanner = Scanner.new(file.read, fixing: true)
    scanner.call
    assert_equal '345882865', scanner.number
  end
end
