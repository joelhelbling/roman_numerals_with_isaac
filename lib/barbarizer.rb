require './lib/number_table'

class Barbarizer
  class << self

    def barbarize numeral
      validate numeral
      original_numeral = numeral.dup

      digits = []
      while numeral.length > 0
        rchar, arabic = find_char_for numeral 

        validate_digits digits, arabic, original_numeral

        digits += arabic
        numeral.gsub! /^#{rchar}/, ''
      end
      sum_up digits
    end

    private

    def find_char_for numeral
      NumberTable.values.find do |r,a|
        numeral.match /^#{r}/
      end
    end

    def sum_up digits
      digits.inject(0) { |sum, n| sum += n }
    end

    def kvetch numeral, comment = nil
      raise ArgumentError.new("Invalid Roman Numeral: #{numeral} (#{comment})")
    end

    def validate numeral
      if has_invalid_characters?(numeral)
        kvetch numeral, 'invalid characters'
      end
    end

    def validate_digits digits, arabic, numeral

      arabic_sum = arabic.inject(0){|sum,n| sum += n}

      if has_ascending_values?(digits, arabic_sum)
        kvetch numeral, 'ascending digit value'
      end

      if digit_gt_eq_prepender? digits, arabic_sum
        kvetch numeral, 'digit equal or greater than prepender'
      end

      if digit_repeated_too_much? digits, arabic_sum
        kvetch numeral, '4 of the same non "M" digit'
      end
    end

    def has_invalid_characters? numeral
      roman_chars = NumberTable.roman_chars.join('')
      !numeral.is_a?(String) || !numeral.match(/^[#{roman_chars}]+$/)    
    end

    def has_ascending_values? digits, arabic_sum
      digits.size > 0 && digits.last < arabic_sum
    end

    def digit_gt_eq_prepender? digits, arabic_sum
      digits.size > 1 && digits[-2] != digits.last && digits[-2].abs <= arabic_sum
    end

    def digit_repeated_too_much? digits, arabic_sum
      comparison_digits = (arabic_sum == 1000) ? 4 : 3
      digits.size > (comparison_digits - 1) &&
        digits[(comparison_digits * -1)..-1].all?{|n| n == arabic_sum}
    end

  end #self
end #barbarizer