require_relative 'spec_helper'

RSpec.describe Nmax do
  describe 'reads the file' do
    text = File.open("#{__dir__}/texts/text.txt", "r")
    empty_file = File.open("#{__dir__}/texts/empty.txt", "r")
    without_numbers = File.open("#{__dir__}/texts/without_numbers.txt", "r")

    it 'runs without output and should show error message' do
      nmax = Nmax::Application.new(text, 0)
      expect(nmax.run()).to eq('The expected amount of numbers is empty')
    end

    it 'runs with negative amount of output numbers and 
    should show error message' do
      nmax = Nmax::Application.new(text, -9)
      expect(nmax.run()).to eq('The expected amount of numbers is empty')
    end

    it 'runs with empty file and should show error message' do
      nmax = Nmax::Application.new(empty_file, 10)
      expect(nmax.run()).to eq('File is empty')
    end

    it 'runs file without numbers and should show error message' do
      nmax = Nmax::Application.new(without_numbers, 10)
      expect(nmax.run()).to eq('No numbers')
    end

    it 'is worked' do
      nmax = Nmax::Application.new(text, 10)
      expect(nmax.run()).to eq([1027739387411, 7702077840, 997950001, 32589695,
        11538317, 54228, 22595, 5838, 5110, 2007])
    end
  end
end
