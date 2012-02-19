require 'spec_helper'

require 'equation_builder'

describe EquationBuilder do
  context 'simple equations' do
    context 'with + operator' do
      subject { EquationBuilder.new([2, 4], 6, '+') }
      its(:solve) { should == '2+4' }
    end

    context 'with - operator' do
      subject { EquationBuilder.new([2, 4], -2, '-') }
      its(:solve) { should == '2-4' }
    end

    context 'with multiple operators' do
      subject { EquationBuilder.new([2, 4, 6], 4, %w(- +)) }
      its(:solve) { should == '2-4+6' }
    end

    context 'with repeating operator' do
      subject { EquationBuilder.new([2, 4, 6], 12, '+') }
      its(:solve) { should == '2+4+6' }
    end

    context 'with multiple repeating operators' do
      subject { EquationBuilder.new([2, 4, 6, 8], 0, %w(+ -)) }
      its(:solve) { should == '2-4-6+8' }
    end
  end

  context 'with long equation' do
    subject { EquationBuilder.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0, %w(* -)) }
    its(:solve) { should == '1*2*3*4*5-6*9-7*8-10' }
  end

  context 'with float numbers' do
    subject { EquationBuilder.new([1, 2], 0.5, %w(/ *)) }
    its(:solve) { should == '1/2' }
  end

  context 'with parentheses' do
    context 'with single parentheses' do
      subject { EquationBuilder.new([1, 2, 4, 5], 17, %w(+ *)) }
      its(:solve) { should == '(1+2)*4+5' }
    end

    context 'with double parentheses' do
      subject { EquationBuilder.new([5, 5, 5, 5], 100, %w(+ *)) }
      its(:solve) { should == '(5+5)*(5+5)' }
    end
  end

  context 'ultimate example' do
    subject { EquationBuilder.new([1, 3, 4, 6], 24, %w(- /)) }
    its(:solve) { should == '6/(1-3/4)' }
  end

  context 'equation not found' do
    subject { EquationBuilder.new([1, 2], 4, '+') }
    its(:solve) { should be_nil }
  end
end