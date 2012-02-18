class EquationBuilder

  def initialize numbers, result, operators
    @numbers = numbers
    @result = result
    @operators = operators
  end

  def solve
    @numbers.permutation do |numbers|
      expression = numbers.join(@operators.first)
      return expression if eval(expression) == @result
    end
    ''
  end
end