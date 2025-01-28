require 'spec_helper'

RSpec.describe CreditOcr do
  describe "it exists" do
    it "loads" do
      expect(CreditOcr).to be_a Module
    end

    it 'loads the sample.txt' do
      expect(fixture('sample_digits').lines.count).to eq(44)
    end

    it 'loads the sample_0.txt' do
      expect(fixture('sample_0').lines.count).to eq(4)
    end
  end

  describe "private helper methods" do
    it "can read #lines_to_array from .txt" do
      file_path = "spec/fixtures/sample_0.txt"
      
      expect(CreditOcr.lines_to_array(file_path)).to eq(
                                                      [
                                                      " _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _ ", 
                                                      "| || || || || || || || || || || || || || || || |", 
                                                      "|_||_||_||_||_||_||_||_||_||_||_||_||_||_||_||_|", 
                                                      "                                                "
                                                      ]
                                                    )
    end

    it "can parse #lines_to_blocks" do
      lines = [
              " _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _ ", 
              "| || || || || || || || || || || || || || || || |", 
              "|_||_||_||_||_||_||_||_||_||_||_||_||_||_||_||_|", 
              "                                                "]

      expect(CreditOcr.lines_to_blocks(lines)).to eq(
                                                    [
                                                      [
                                                      " _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _ ", 
                                                      "| || || || || || || || || || || || || || || || |", 
                                                      "|_||_||_||_||_||_||_||_||_||_||_||_||_||_||_||_|"
                                                      ]
                                                    ]
                                                  )
    end

    it "can parse #blocks_to_numbers" do 
      blocks = [
                [
                  " _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _ ", 
                  "| || || || || || || || || || || || || || || || |", 
                  "|_||_||_||_||_||_||_||_||_||_||_||_||_||_||_||_|"
                ]
              ]

      expect(CreditOcr.blocks_to_numbers(blocks)).to eq(["0000000000000000"])
    end

    it "can #number_lookup" do
      block = [
              " _ ",
              "| |",
              "|_|"
            ]

      expect(CreditOcr.number_lookup(block)).to eq("0")
    end
  end

  describe "integration" do
    it "can #ocr_file_to_policy_numbers" do 
      file_path = "spec/fixtures/sample_digits.txt"

      expect(CreditOcr.ocr_file_to_credit_numbers(file_path)).to eq(["0000000000000000", 
                                                                    "1111111111111111", 
                                                                    "2222222222222222", 
                                                                    "3333333333333333", 
                                                                    "4444444444444444", 
                                                                    "5555555555555555", 
                                                                    "6666666666666666", 
                                                                    "7777777777777777", 
                                                                    "8888888888888888", 
                                                                    "9999999999999999", 
                                                                    "1234567890123456"])
    end
  end
end