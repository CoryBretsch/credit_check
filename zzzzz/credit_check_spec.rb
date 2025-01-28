require './lib/credit_check'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe CreditCheck do
  it "exists" do
    credit_check = CreditCheck.new("5541808923795240")

    expect(credit_check).to be_a CreditCheck
  end

  it "has a card number" do
    credit_check = CreditCheck.new("5541808923795240")

    expect(credit_check.card_number).to eq("5541808923795240")
  end

  it "has a limit" do
    credit_check = CreditCheck.new("5541808923795240")

    expect(credit_check.limit).to be 15000
  end

  it "can sum the card number according to Luhn Algo" do
    credit_check1 = CreditCheck.new("5541808923795240")
    credit_check2 = CreditCheck.new("4024007136512380")
    
    # Note - this test also tests process_doubles & process_singles methods

    expect(credit_check1.sum_results).to be 70
    expect(credit_check2.sum_results).to be 50
  end


  it "can determine a valid card number" do
    credit_check1 = CreditCheck.new("5541808923795240")
    invalid_number1 = CreditCheck.new("5541801923795240")

    expect(credit_check1.is_valid?).to be true
    expect(invalid_number1.is_valid?).to be false
  end

  it "cas list the last four" do
    credit_check = CreditCheck.new("5541808923795240")

    expect(credit_check.last_four).to eq("5240")
  end

  it "can print a valid or invalid responce" do
    credit_check1 = CreditCheck.new("5541808923795240")
    invalid_number1 = CreditCheck.new("5541801923795240")

    expect(credit_check1.give_responce). to eq("the number [5541808923795240] is valid!")
    expect(invalid_number1.give_responce).to eq("the number [5541801923795240] is invalid!")
  end
end