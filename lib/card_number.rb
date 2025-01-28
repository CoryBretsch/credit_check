class CardNumber
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def self.create_card_number_objects(card_numbers)
    card_numbers.map { |card| CardNumber.new(card) } 
  end

  def validate_card_numbers
    if @card_number.include?("?")
      @card_number += " ILL"
    elsif @card_number.size != 16
      @card_number += " ERR"
    else 
      if invalid_card_number?
        @card_number += " ERR"
      else
        @card_number
      end
    end
  end

  private

    def invalid_card_number?
      sum_results.remainder(10) != 0
    end

    def sum_results
      card_number_array = card_number.chars
      process_doubles(card_number_array) + process_singles(card_number_array)
    end
  
    def process_doubles(card_number_array)
      sub_array_index_even = card_number_array[(0..15).step(2)]
      sub_array_to_int = sub_array_index_even.map {|index| index.to_i}
      sub_array_double = sub_array_to_int.map {|index| index*2}
      sub_array_join = sub_array_double.join.chars
      doubles = sub_array_join.map {|index| index.to_i}
      doubles.sum 
    end
  
    def process_singles(card_number_array)
      sub_array_index_odd = card_number_array[(1..14).step(2)]
      singles = sub_array_index_odd.map {|index| index.to_i}
      singles.sum
    end

end