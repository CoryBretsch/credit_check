require_relative '../lib/policy_ocr'
require_relative '../lib/policy_number'


# assigns input file and output file from command line run command
input_file_path = ARGV[0]
output_file_path = ARGV[1]

# Script 1 -- OCR pipes and underscore to policy numbers
policy_ocr = PolicyOcr.ocr_file_to_policy_numbers(input_file_path)

# Script 2 -- Validation of policy numbers
policy_validation = PolicyNumber.validate_policy_numbers(policy_ocr)

# Creates and writes validated numbers to output file path
File.open(output_file_path, "w") do |file|
  file.puts(policy_validation.join("\n"))
end

# Prints to console if program has successfully run
puts "\n\n" + "-->  Output written to '#{output_file_path}'  <--" + "\n\n\n" 