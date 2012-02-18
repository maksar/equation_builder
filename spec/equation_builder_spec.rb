require 'spec_helper'

require 'equation_builder'

describe EquationBuilder do
  context 'simple equations' do
    context 'with + operator' do
      subject { EquationBuilder.new([2, 4], 6, ['+']) }
      its(:solve) { should == '2+4' }
    end

    context 'with - operator' do
      subject { EquationBuilder.new([2, 4], -2, ['-']) }
      its(:solve) { should == '2-4' }
    end
  end
end