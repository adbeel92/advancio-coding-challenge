# frozen_string_literal: true

# The String extension
class String
  def number?
    !Float(self).nil?
  rescue StandardError => _e
    false
  end

  def levenshtein(other, insertion = 2, deletion = 2, substitution = 1)
    return nil if nil? || other.nil?

    distance_matrix = []
    distance_matrix[0] = (0..length).collect { |i| i * insertion }
    populate_distance_matrix(
      distance_matrix, other: other, insertion: insertion, deletion: deletion, substitution: substitution
    )
    distance_matrix[other.length][length]
  end

  private

  def populate_distance_matrix(distance_matrix, other:, insertion:, deletion:, substitution:)
    fill = [0] * (length - 1)
    (1..other.length).each do |i|
      distance_matrix[i] = [i * deletion, fill.flatten]
      (1..length).each do |j|
        distance_matrix[i][j] = [
          distance_matrix[i - 1][j - 1] + (self[j - 1] == other[i - 1] ? 0 : substitution),
          distance_matrix[i][j - 1] + insertion, distance_matrix[i - 1][j] + deletion
        ].min
      end
    end
  end
end
