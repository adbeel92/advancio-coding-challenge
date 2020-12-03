# frozen_string_literal: true

require_relative '../lib/validator'
require_relative '../lib/matcher'

# The calculator fixer
class CalculatorFixer
  attr_reader :scanned_number, :scanned_result, :fixed

  def initialize(scanner)
    @scanned_number = scanner.number
    @scanned_result = scanner.result
    @fixed = false
  end

  def call
    return scanned_number if validator.valid?

    suggested_number = ''
    position = scanned_result.size
    scanned_result.each_value do |value|
      suggested_number += suggest_num_char_in_position(value, position)
      position -= 1
    end
    suggested_number
  end

  private

  def suggest_num_char_in_position(value, position)
    return value[:num_char] if fixed

    similar_nums = Matcher.new(value[:num_string]).call.map(&:to_i)
    discount_num = similar_nums.detect { |snum| residue_options.include?((value[:num_char].to_i - snum) * position) }
    return value[:num_char] if discount_num.nil?

    @fixed = true
    discount_num.to_s
  end

  def validator
    @validator ||= Validator.new(scanned_number)
  end

  def residue
    @residue ||= validator.operation_value % 11
  end

  def residue_options
    @residue_options ||= [residue, residue - 11]
  end
end
