require './lib/number_table'

class Barbarizer
  class << self

    def barbarize numeral
      ensure_valid numeral

      number = 0
      while numeral.length > 0
        rchar, arabic = NumberTable.values.find do |r,a|
          numeral.match /^#{r}/
        end
        number += arabic
        numeral.gsub! /^#{rchar}/, ''
      end
      number
    end

    private

    def ensure_valid numeral
      # notes for detecting invalid roman numerals
      # examples: IC, IXIV, IXL, CDCDCD
      # when a lower character prepends a higher one, it must be of
      # the previous order, but NOT of the previous-previous order

      if !numeral.is_a?(String) || !numeral.match(/^[#{NumberTable.roman_chars.join('')}]+$/)
        raise ArgumentError.new("Invalid Roman Numeral: #{numeral}")
      end
    end

  end #self
end #barbarizer