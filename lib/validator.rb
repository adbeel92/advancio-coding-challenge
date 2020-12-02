# frozen_string_literal: true

# The app
class Validator
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def valid?
    (calculate % 11).zero?
  end

  private

  def calculate
    number.reverse.each_char.with_index.inject(0) { |sum, (num, index)| sum + num.to_i * (index + 1) }
  end
end
