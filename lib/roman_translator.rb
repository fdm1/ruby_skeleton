class RomanTranslator
  THOUSAND = 'M'.freeze
  FIVE_HUNDRED = 'D'.freeze
  HUNDRED = 'C'.freeze
  FIFTY = 'L'.freeze
  TEN = 'X'.freeze
  FIVE = 'V'.freeze
  ONE = 'I'.freeze

  def self.int_to_roman(num)
    thousands = num / 1000
    hundreds = (num - (thousands * 1000)) / 100
    tens = (num - (thousands * 1000) - (hundreds * 100)) / 10
    ones = num - (thousands * 1000) - (hundreds * 100) - (tens * 10)
    convert_num_place(thousands, THOUSAND) +
      convert_num_place(hundreds, HUNDRED) +
      convert_num_place(tens, TEN) +
      convert_num_place(ones, ONE)
  end

  def self.convert_num_place(num, place)
    return place * num if place == THOUSAND
    return place * num unless num >= 4

    five_x = case place
             when ONE
               FIVE
             when TEN
               FIFTY
             when HUNDRED
               FIVE_HUNDRED
             end
    next_place = case place
                 when ONE
                   TEN
                 when TEN
                   HUNDRED
                 when HUNDRED
                   THOUSAND
                 end
    return place + five_x if num == 4
    return five_x if num == 5
    return place + next_place if num == 9

    five_x + (place * (num - 5))
  end
end
