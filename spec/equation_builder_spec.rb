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

    context 'with multiple operators' do
      subject { EquationBuilder.new([2, 4, 6], 4, ['-', '+']) }
      its(:solve) { should == '2-4+6' }
    end

    context 'with repeating operator' do
      subject { EquationBuilder.new([2, 4, 6], 12, ['+']) }
      its(:solve) { should == '2+4+6' }
    end

    context 'with multiple repeating operators' do
      subject { EquationBuilder.new([2, 4, 6, 8], 0, ['+', '-']) }
      its(:solve) { should == '2-4-6+8' }
    end
  end

  context 'equation not found' do
    subject { EquationBuilder.new([1, 2], 4, ['+']) }
    its(:solve) { should == '' }
  end
end