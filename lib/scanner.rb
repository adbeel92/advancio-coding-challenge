# frozen_string_literal: true

# The scanner
class Scanner
  attr_reader :number

  def initialize(file_content)
    @number = ''
    @file_lines = file_content_to_hash(file_content)
  end

  def call
    file_lines.each_value do |value|
      @number += numbers_mapping.key(value) || '?'
    end
  end

  private

  attr_reader :file_lines

  def file_content_to_hash(file_content)
    file_content.split("\n").each_with_object({}) do |row_content, hash|
      row_content.scan(/.{3}/).each_with_index do |chars, index|
        hash[index] ||= ''
        hash[index] += chars
      end
    end
  end

  def numbers_mapping
    @numbers_mapping ||= {
      '0' => ' _ | ||_|', '1' => '     |  |', '2' => ' _  _||_ ',
      '3' => ' _  _| _|', '4' => '   |_|  |', '5' => ' _ |_  _|',
      '6' => ' _ |_ |_|', '7' => ' _   |  |', '8' => ' _ |_||_|',
      '9' => ' _ |_| _|'
    }
  end
end
