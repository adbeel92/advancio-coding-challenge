# frozen_string_literal: true

# The scanner
class Scanner
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    '1234'
  end
end
