
class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def self.calculate(num_a, num_b, operation)
    raise UnsupportedOperation, 'Invalid operation' unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError, 'Input must be numbers' unless [num_a, num_b].all? { |n| n.is_a?(Numeric) }

    case operation
    when '+'
      "#{num_a} + #{num_b} = #{num_a + num_b}"
    when '/'
      return 'Division by zero is not allowed.' if num_b.zero?

      "#{num_a} / #{num_b} = #{num_a / num_b}"
    when '*'
      "#{num_a} * #{num_b} = #{num_a * num_b}"
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
