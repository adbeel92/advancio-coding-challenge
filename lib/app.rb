# frozen_string_literal: true

require_relative '../lib/scanner'
require_relative '../lib/reporter'
require_relative '../lib/calculator_fixer'

# The app
class App
  attr_reader :file, :fixing

  def initialize(file, fixing: false)
    @file = file
    @fixing = fixing
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
    @scanner ||= Scanner.new(file.read, fixing: fixing)
  end

  def reporter
    @reporter ||= Reporter.new(number)
  end

  def number
    return scanner.number unless fixing

    CalculatorFixer.new(scanner).call
  end
end
