# frozen_string_literal: true

require_relative '../lib/reporter_data'

# The reporter
class Reporter
  attr_reader :number, :report_file

  def initialize(number)
    @number = number
  end

  def call
    build_report_file
  end

  private

  def reporter_data
    @reporter_data ||= ReporterData.new(number)
  end

  def build_report_file
    @report_file = Tempfile.open("report-#{Time.now.to_i}.txt")
    report_file.puts(reporter_data.call)
    report_file.close
  end
end
