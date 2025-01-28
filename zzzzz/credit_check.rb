class CreditCheck
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def sum_results
    card_number_array = card_number.chars
    process_doubles(card_number_array) + process_singles(card_number_array)
  end

  def is_valid?
    sum_results.remainder(10) == 0
  end

  def process_doubles(card_number_array)
    sub_array_index_even = card_number_array[(0..15).step(2)]
    sub_array_to_int = sub_array_index_even.map {|index| index.to_i} #Do this long
    sub_array_double = sub_array_to_int.map {|index| index*2} #this can be done in one block
    sub_array_join = sub_array_double.join.chars
    doubles = sub_array_join.map {|index| index.to_i}
    doubles.sum 
  end

  def process_singles(card_number_array)
    sub_array_index_odd = card_number_array[(1..14).step(2)]
    singles = sub_array_index_odd.map {|index| index.to_i}
    singles.sum
  end

  def give_responce 
    if is_valid? == true
      "the number [#{card_number}] is valid!"
    else is_valid? == false
      "the number [" + card_number + "] is invalid!"
    end
  end

  def last_four
    card_number_array = card_number.chars
    last_four_array = card_number_array[12..15]
    last_four_array.join
  end

end