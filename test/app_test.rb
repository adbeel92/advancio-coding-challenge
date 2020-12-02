# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/app'

# Test app
class AppTest < Minitest::Test
  def test_the_file_one
    file = file_fixture('file-1.txt')
    app = App.new(file)
    report_file = File.open(app.call.path, 'r')
    assert_equal "123456789\n", report_file.read
  end

  def test_the_file_two
    file = file_fixture('file-2.txt')
    app = App.new(file)
    report_file = File.open(app.call.path, 'r')
    assert_equal "345882865\n", report_file.read
  end

  def test_the_file_error_one
    file = file_fixture('file-err-1.txt')
    app = App.new(file)
    report_file = File.open(app.call.path, 'r')
    assert_equal "123456788 ERR\n", report_file.read
  end

  def test_the_file_error_two
    file = file_fixture('file-err-2.txt')
    app = App.new(file)
    report_file = File.open(app.call.path, 'r')
    assert_equal "345882866 ERR\n", report_file.read
  end

  def test_the_file_illegal_one
    file = file_fixture('file-ill-1.txt')
    app = App.new(file)
    report_file = File.open(app.call.path, 'r')
    assert_equal "12345678? ILL\n", report_file.read
  end

  def test_the_file_illegal_two
    file = file_fixture('file-ill-2.txt')
    app = App.new(file)
    report_file = File.open(app.call.path, 'r')
    assert_equal "34588286? ILL\n", report_file.read
  end
end
