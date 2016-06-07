require './lib/number_table'

# highest number in roman numerals is 4999

class Romanizer

  class << self
    def romanize number
      ensure_valid number

      roman = ''
      while number > 0
        rchar, arabic = find_char_for number
        
        roman << rchar
        arabic.each do |n|
          number -= n
        end
      end
      roman
    end

    private

    def find_char_for number
      NumberTable.values.find do |r,a|
        number >= a.inject(0){|sum,n| sum += n}
      end
    end

    def ensure_valid number
      if !number.is_a?(Fixnum) || number > 4999 || number < 1
        raise ArgumentError.new('Rome never knew such a number.')
      end
    end

  end # class << self

end
