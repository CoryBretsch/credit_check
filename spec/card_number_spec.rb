require 'spec_helper'

RSpec.describe CardNumber do 
  describe "exists" do
    it "exists" do
      expect(CardNumber).to be_a Class
    end
  end

  describe ".validate_card_numbers" do
    describe "valid" do
      it "can determine if card number is valid" do
        cn1 = CardNumber.new("5541808923795240")
        cn2 = CardNumber.new("4024007136512380")
        result1 = cn1.validate_card_numbers
        result2 = cn2.validate_card_numbers
        
        expect(result1).to eq("5541808923795240")
        expect(result2).to eq("4024007136512380")
      end
    end
    
    describe "ILL" do
      it "can determine if card number is illegible" do
        cn = CardNumber.new("1?2?3?1??0165793")
        result = cn.validate_card_numbers
        
        expect(result).to eq("1?2?3?1??0165793 ILL")
      end
    end

    describe "ERR" do
      it "can determine if policy number is an error" do 
        cn1 = CardNumber.new("5541801923795240")
        cn2 = CardNumber.new("4024007106512380")
        result1 = cn1.validate_card_numbers
        result2 = cn2.validate_card_numbers
        
        expect(result1).to eq("5541801923795240 ERR")
        expect(result2).to eq("4024007106512380 ERR")
      end

      it "can determine if policy number is an error - more than 16 char" do 
        cn = CardNumber.new("12345678901234567")
        result = cn.validate_card_numbers
        
        expect(result).to eq("12345678901234567 ERR")
      end
    end

    end
  end
