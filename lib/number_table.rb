class NumberTable
  NUMBERS = {
    'M'  => [ 1000       ],
    'CM' => [ -100, 1000 ],
    'D'  => [  500       ],
    'CD' => [ -100,  500 ],
    'C'  => [  100       ],
    'XC' => [  -10,  100 ],
    'L'  => [   50       ],
    'XL' => [  -10,   50 ],
    'X'  => [   10       ],
    'IX' => [   -1,   10 ],
    'V'  => [    5       ],
    'IV' => [   -1,    5 ],
    'I'  => [    1       ]
  }
  
  def self.values
    NUMBERS
  end

  def self.keys
    values.keys
  end

  def self.roman_chars
    keys.select{|char| char.length == 1}
  end
end