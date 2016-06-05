require 'spec_helper'
require './lib/barbarizer'

describe Barbarizer do
  context 'valid roman numerals' do
    When(:result) { Barbarizer.barbarize numeral }

    context 'numeral: I' do
      Given(:numeral) { 'I' }
      Then { expect(result).to eq(1) }
    end
    context 'numeral: II' do
      Given(:numeral) { 'II' }
      Then { expect(result).to eq(2) }
    end
    context 'numeral: IV' do
      Given(:numeral) { 'IV' }
      Then { expect(result).to eq(4) }
    end
    context 'numeral: VIII' do
      Given(:numeral) { 'VIII' }
      Then { expect(result).to eq(8) }
    end
    context 'numeral: MMMMCMXCIX' do
      Given(:numeral) { 'MMMMCMXCIX' }
      Then { expect(result).to eq(4999) }
    end
  end

  context 'invalid roman numerals' do
    context 'numeral: dog' do
      Given(:numeral) { 'dog' }
      Then { expect{Barbarizer.barbarize numeral}.to raise_error(ArgumentError) }
    end
    context 'numeral: (empty string)' do
      Given(:numeral) { '' }
      Then { expect{Barbarizer.barbarize numeral}.to raise_error(ArgumentError) }
    end
    context 'numeral: integer' do
      Given(:numeral) { 3 }
      Then { expect{Barbarizer.barbarize numeral}.to raise_error(ArgumentError) }
    end
    context 'numeral: IC' do
      Given(:numeral) { 'IC' }
      Then { expect{Barbarizer.barbarize numeral}.to raise_error(ArgumentError) }
    end
  end #context
end #describe