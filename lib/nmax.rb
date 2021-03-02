require "nmax/version"
require_relative "output"

module Nmax

  class Application
    def initialize(stdin = [], argv = 0)
      @stdin = stdin
      @amount = argv.to_i
    end

    def run()
      return Outputs
        .show('The expected amount of numbers is empty') if @amount <= 0 

      text = @stdin.read.strip

      return Outputs.show('File is empty') if text.empty? 

      parsing_numbers(text)
    end

    def parsing_numbers(text)
      numbers = text.gsub(/\D/, ' ').split(' ').map{|a| a.to_i}

      return Outputs.show('No numbers') if numbers.empty? 

      sorting(numbers)
    end

    def sorting(numbers)
      sorted_numbers = numbers.sort.reverse

      return Outputs.show(sorted_numbers[0 .. @amount  - 1])
    end
  end
end
