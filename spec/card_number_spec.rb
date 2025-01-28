require 'spec_helper'

RSpec.describe PolicyNumber do 
  describe "exists" do
    it "exists" do
      expect(PolicyNumber).to be_a Class
    end
  end

  describe ".validate_policy_numbers" do
    describe "valid" do
      it "can determine if policy number is valid" do
        pn1 = PolicyNumber.new("345882865")
        pn2 = PolicyNumber.new("123456789")
        result1 = pn1.validate_policy_numbers
        result2 = pn2.validate_policy_numbers
        
        expect(result1).to eq("345882865")
        expect(result2).to eq("123456789")
      end
    end
    
    describe "ILL" do
      it "can determine if policy number is illegible" do
        pn = PolicyNumber.new("1?2?3?1??")
        result = pn.validate_policy_numbers
        
        expect(result).to eq("1?2?3?1?? ILL")
      end

      # it "can determine if policy number is illegible - more than 9 char" do
      #   result = PolicyNumber.validate_policy_numbers(["1?2?3?1???"])
        
      #   expect(result).to eq(["1?2?3?1??? ILL"])
      # end

      # it "can determine if policy number is illegible - less than 9 char" do
      #   result = PolicyNumber.validate_policy_numbers(["1?2?3?1?"])
        
      #   expect(result).to eq(["1?2?3?1? ILL"])
      # end
    end

    describe "ERR" do
      it "can determine if policy number is an error" do 
        pn = PolicyNumber.new("987654321")
        result = pn.validate_policy_numbers
        
        expect(result).to eq("987654321 ERR")
      end

      it "can determine if policy number is an error - more than 9 char" do 
        pn = PolicyNumber.new("1234567890")
        result = pn.validate_policy_numbers
        
        expect(result).to eq("1234567890 ERR")
      end

      # it "can determine if policy number is an error - less than 9 char" do 
      #   result = PolicyNumber.validate_policy_numbers(["12345678"])
        
      #   expect(result).to eq(["12345678 ERR"])
      # end
    end

    # describe "integration test" do
    #   it "can return array of validated, errored, illegible policy numbers" do 
    #     pn = PolicyNumber.new("345882865")
    #     result = PolicyNumber.validate_policy_numbers(["345882865", "1?2?3?1??", "12345678"])

    #     expect(result).to eq(["345882865", "1?2?3?1?? ILL", "12345678 ERR"])
    #   end
    end
  end
