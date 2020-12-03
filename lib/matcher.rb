# frozen_string_literal: true

require './extensions/string'
require_relative '../lib/numbers_mapping'

# The matcher
class Matcher
  attr_reader :num_string

  def initialize(num_string)
    @num_string = num_string
  end

  def call
    find_similar_numbers
  end

  private

  def find_similar_numbers
    NUMBERS_MAPPING.select do |num, string|
      next unless num_string.levenshtein(string) == 1

      num
    end.keys
  end
end
