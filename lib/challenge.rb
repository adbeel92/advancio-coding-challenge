# frozen_string_literal: true

require_relative '../lib/scanner'

# The challenge
class Challenge
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    Scanner.new(file).call
  end
end
