# frozen_string_literal: true

# The String extension
class String
  def number?
    !Float(self).nil?
  rescue StandardError => _e
    false
  end
end
