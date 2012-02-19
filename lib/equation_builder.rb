class EquationBuilder

  def initialize _numbers, _result, _operators
    @numbers = _numbers
    @result = _result
    @operators = Array(_operators)

    @matcher = proc { |numbers, operators, result| numbers.zip(operators).flatten.join if eval(make_float(numbers).zip(operators).flatten.join) == result }
  end


  def solve
    solve_simple || solve_with_parentheses || nil
  end

  private

  def solve_simple
    with_permutations do |numbers, operators|
      result = @matcher.call(numbers, operators, @result)
      return result if result
    end
    nil
  end

  def solve_with_parentheses
    with_permutations do |numbers, operators|
      with_parentheses(@numbers.length.div(2), numbers, (0..@numbers.length).to_a) do |numbers_with_parentheses|
        result = @matcher.call(numbers_with_parentheses, operators, @result)
        return result if result
      end
    end
    nil
  end

  def with_parentheses number, numbers, parentheses_options, &block
    return if number == 0

    parentheses_options.combination(2) do |positions|
      block.call add_parentheses numbers.dup, positions
    end

    parentheses_options.combination(2) do |positions|
      with_parentheses number - 1, add_parentheses(numbers.dup, positions), parentheses_options, &block
    end
  end

  def with_permutations &block
    @numbers.permutation do |numbers|
      @operators.repeated_permutation @numbers.length - 1 do |operators|
        block.call(numbers, operators)
      end
    end
  end

  def make_float numbers
    numbers.map { |element| "#{element}*1.0" }
  end

  def add_parentheses numbers, position
    numbers[position.first] = "(#{numbers[position.first]}"
    numbers[position.last] = "#{numbers[position.last]})"
    numbers
  end
end