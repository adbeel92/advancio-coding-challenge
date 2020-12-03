# frozen_string_literal: true

require './extensions/string'
require_relative '../lib/numbers_mapping'
require_relative '../lib/matcher'

# The scanner
class Scanner
  attr_reader :result, :number, :fixing

  def initialize(file_content, fixing: false)
    @result = {}
    @number = ''
    @file_lines = file_content_to_hash(file_content)
    @fixing = fixing
  end

  def call
    file_lines.each do |key, value|
      num_char = numbers_mapping.key(value) || guess_what_should_be(value)
      @number += num_char
      @result[key] = {
        num_string: value,
        num_char: num_char
      }
    end
  end

  private

  attr_reader :file_lines

  def guess_what_should_be(value)
    return '?' unless fixing

    possible_numbers = Matcher.new(value).call
    possible_numbers.first || '?'
  end

  def file_content_to_hash(file_content)
    file_content.split("\n").each_with_object({}) do |row_content, hash|
      row_content.scan(/.{3}/).each_with_index do |chars, index|
        hash[index] ||= ''
        hash[index] += chars
      end
    end
  end

  def numbers_mapping
    @numbers_mapping ||= NUMBERS_MAPPING
  end
end
