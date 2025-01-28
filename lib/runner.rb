require_relative '../lib/credit_ocr'
require_relative '../lib/card_number'
require 'pry'


# assigns input file and output file from command line run command
input_file_path = ARGV[0]
output_file_path = ARGV[1]

# Script 1 -- OCR pipes and underscore to policy numbers
credit_ocr = PolicyOcr.ocr_file_to_credit_numbers(input_file_path)

# Script 2 - makes policy number objects
card_number_objects = PolicyNumber.create_card_number_objects(credit_ocr)

# Script 2 -- Validation of policy numbers
card_numbers = card_number_objects.map { |card_number| card_number.validate_card_numbers }

# Creates and writes validated numbers to output file path
File.open(output_file_path, "w") do |file|
  card_numbers.each do |policy|
    file.puts(policy)
  end
end



# Prints to console if program has successfully run
puts "\n\n" + "-->  Output written to '#{output_file_path}'  <--" + "\n\n\n" 