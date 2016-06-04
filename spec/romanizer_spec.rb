require 'spec_helper'
require './lib/romanizer'

describe Romanizer do
  context 'valid numbers' do
    When(:result) { Romanizer.romanize number }
  
    context 'number: 1' do
      Given(:number) { 1 }
      Then { expect(result).to eq('I') }
    end
    context 'number: 2' do
      Given(:number) { 2 }
      Then { expect(result).to eq('II') }
    end
    context 'number: 4' do
      Given(:number) { 4 }
      Then { expect(result).to eq('IV')}
    end
    context 'number: 5' do
      Given(:number) { 5 }
      Then { expect(result).to eq('V')}
    end
    context 'number: 6' do
      Given(:number) { 6 }
      Then { expect(result).to eq('VI')}
    end
    context 'number: 7' do
      Given(:number) { 7 }
      Then { expect(result).to eq('VII')}
    end
    context 'number: 9' do
      Given(:number) { 9 }
      Then { expect(result).to eq('IX')}
    end
    context 'number: 10' do
      Given(:number) { 10 }
      Then { expect(result).to eq('X')}
    end
    context 'number: 13' do
      Given(:number) { 13 }
      Then { expect(result).to eq('XIII')}
    end
    context 'number: 14' do
      Given(:number) { 14 }
      Then { expect(result).to eq('XIV')}
    end
    context 'number: 15' do
      Given(:number) { 15 }
      Then { expect(result).to eq('XV')}
    end
    context 'number: 19' do
      Given(:number) { 19 }
      Then { expect(result).to eq('XIX')}
    end
    context 'number: 39' do
      Given(:number) { 39 }
      Then { expect(result).to eq('XXXIX')}
    end
    context 'number: 40' do
      Given(:number) { 40 }
      Then { expect(result).to eq('XL')}
    end
    context 'number: 49' do
      Given(:number) { 49 }
      Then { expect(result).to eq('XLIX')}
    end
    context 'number: 50' do
      Given(:number) { 50 }
      Then { expect(result).to eq('L')}
    end
    context 'number: 60' do
      Given(:number) { 60 }
      Then { expect(result).to eq('LX')}
    end
    context 'number: 89' do
      Given(:number) { 89 }
      Then { expect(result).to eq('LXXXIX')}
    end
    context 'number: 90' do
      Given(:number) { 90 }
      Then { expect(result).to eq('XC')}
    end
    context 'number: 100' do
      Given(:number) { 100 }
      Then { expect(result).to eq('C')}
    end
    context 'number: 399' do
      Given(:number) { 399 }
      Then { expect(result).to eq('CCCXCIX')}
    end
    context 'number: 400' do
      Given(:number) { 400 }
      Then { expect(result).to eq('CD')}
    end
    context 'number: 500' do
      Given(:number) { 500 }
      Then { expect(result).to eq('D')}
    end
    context 'number: 900' do
      Given(:number) { 900 }
      Then { expect(result).to eq('CM')}
    end
    context 'number: 1000' do
      Given(:number) { 1000 }
      Then { expect(result).to eq('M')}
    end
    context 'number: 4999' do
      Given(:number) { 4999 }
      Then { expect(result).to eq('MMMMCMXCIX')}
    end
  end

  context 'invalid numbers' do
    context 'number: 5000' do
      Given(:number) { 5000 }
      Then { expect{Romanizer.romanize number}.to raise_error(ArgumentError) }
    end
    context 'number: 0' do
      Given(:number) { 0 }
      Then { expect{Romanizer.romanize number}.to raise_error(ArgumentError) }
    end
    context 'number: 1.5' do
      Given(:number) { 1.5 }
      Then { expect{Romanizer.romanize number}.to raise_error(ArgumentError) }
    end
  end
end
