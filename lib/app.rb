# frozen_string_literal: true

require_relative '../lib/scanner'
require_relative '../lib/reporter'

# The app
class App
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    scan_number
    build_report
    reporter.report_file
  end

  private

  def scan_number
    scanner.call
  end

  def build_report
    reporter.call
  end

  def scanner
    @scanner ||= Scanner.new(file.read)
  end

  def reporter
    @reporter ||= Reporter.new(scanner.number)
  end
end
