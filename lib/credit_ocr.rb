module CreditOcr

  # constant hash map for pipes and underscores numbers to digits
  DIGIT_MAP = {
    " _ " +
    "| |" +
    "|_|" => "0",
    "   " +
    "  |" +
    "  |" => "1",
    " _ " +
    " _|" +
    "|_ " => "2",
    " _ " +
    " _|" +
    " _|" => "3",
    "   " +
    "|_|" +
    "  |" => "4",
    " _ " +
    "|_ " +
    " _|" => "5",
    " _ " +
    "|_ " +
    "|_|" => "6",
    " _ " +
    "  |" +
    "  |" => "7",
    " _ " +
    "|_|" +
    "|_|" => "8",
    " _ " +
    "|_|" +
    " _|" => "9"
  }

  # core functionality of this module with helper methods below 'private'
  def self.ocr_file_to_credit_numbers(file_path) 
    lines = lines_to_array(file_path)
    blocks = lines_to_blocks(lines)
    blocks_to_numbers(blocks)
  end


  private 

    # reads lines from .txt file into an array with each line as an element
    def self.lines_to_array(file_path)
      File.readlines(file_path, chomp: true)
    end

    # parses the first 3 of 4 elements(lines from method above) into nested array, ignoring the 4th element(line)
    def self.lines_to_blocks(lines)
      blocks = [] 
      lines.each_slice(4) do |block| 
        digit_rows = block[0, 3]
        blocks << digit_rows
      end
      blocks
    end

    # takes each nested array element from the method above and sends it to the .number_lookup method below
    def self.blocks_to_numbers(blocks)
      policy_numbers = []
      blocks.each do |block|
        number_block = number_lookup(block)
        policy_numbers << number_block
      end
      policy_numbers
    end

    # takes a 3x3 cell and matches it to the constant DIGIT_MAP at the top of this module, or returns a "?" if there is no match
    def self.number_lookup(block)
      digits = ""
      total_width = block[0].size
      col_start = 0
      while col_start < total_width
        pattern = ""
        block.each do |line|
          pattern += line[col_start, 3]
        end
        digit = DIGIT_MAP[pattern] || "?"
        digits += digit
        col_start += 3
      end
      digits    
    end

end
