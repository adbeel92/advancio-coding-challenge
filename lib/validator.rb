# frozen_string_literal: true

# The validator
class Validator
  attr_reader :number, :operation_value

  def initialize(number)
    @number = number
    @operation_value = calculate_operation_value
  end

  def valid?
    (operation_value % 11).zero?
  end

  private

  def calculate_operation_value
    number.reverse.each_char.with_index.inject(0) { |sum, (num, index)| sum + num.to_i * (index + 1) }
  end
end
