# highest number in roman numerals is 4999

class Romanizer

  class << self
    def roman_values
      {
        'M' => 1000,
        'CM' => 900,
        'D' => 500,
        'CD' => 400,
        'C' => 100,
        'XC' => 90,
        'L' => 50,
        'XL' => 40,
        'X' => 10,
        'IX' => 9,
        'V' => 5,
        'IV' => 4,
        'I' => 1
      }
    end

    def romanize number
      ensure_valid number

      roman = ''
      while number > 0
        rchar, arabic = roman_values.find do |r,a|
          number >= a
        end
        roman << rchar
        number -= arabic
      end
      roman
    end

    private

    def ensure_valid number
      if !number.is_a?(Fixnum) || number > 4999 || number < 1
        raise ArgumentError.new('Rome never knew such a number.')
      end
    end

  end # class << self

end
