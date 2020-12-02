# frozen_string_literal: true

require './extensions/string'
require_relative '../lib/validator'

# The reporter
class ReporterData
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def call
    generate_report_content
  end

  private

  def generate_report_content
    return "#{number.gsub(/\D/, '?')} ILL" unless number.number?
    return "#{number} ERR" unless validator.valid?

    number
  end

  def validator
    @validator ||= Validator.new(number)
  end
end
