# Credit Check
This script parses credit card numbers written using pipes and underscores into actual numbers. It then validates each credit card number using the Luhn Algorithm. The script labeles each card number as valid, in-valid (ERR), or illegible (ILL). Any pipe and underscore number that is not recognized as a digit is replaced with a question mark (?). Both the input and output of this application are .txt files.

A visual of the input .txt file, containing the credit card's numbers using pipes and underscores, looks like:

![Screenshot 2025-01-28 at 3 07 16 PM](https://github.com/user-attachments/assets/bd263ba0-61a5-49ee-8bbc-cbf2aa4cf5b5)

A visual of the output .txt file, containing the parsed policy numbers with their validation code, looks like:

![Screenshot 2025-01-28 at 3 10 53 PM](https://github.com/user-attachments/assets/771da91d-f316-40fd-8f92-58d13c94945b)

## Background: Luhn Algorithm

The Luhn algorithm is a check-summing algorithm best known for checking the validity of credit card numbers.

You can checkout the full description on Wikipedia: http://en.wikipedia.org/wiki/Luhn_algorithm

### Description

(adapted from Wikipedia)

The formula verifies a number against its included check digit, which is usually appended to a partial account number to generate the full account number. This full account number must pass the following test:

* starting with the first digit, double the value of every other digit
* if the product of this doubling operation is greater than 9 (e.g., 7 * 2 = 14), then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5).
* take the sum of all the digits
* if the sum is divisible by ten, the number is valid

### Example

#### Validating an Account Number

Using `5541808923795240` as our sample input:

```
Account number:        5    5    4    1    8    0    8    9    2    3    7    9    5    2    4    0
2x every other digit:  10   5    8    1    16   0    16   9    4    3    14   9    10   2    8    0
Summed digits over 10: 1    5    8    1    7    0    7    9    4    3    5    9    1    2    8    0
Results summed:        70
Divisible by 10?:      70 % 10 == 0
```

Since the summed results modulo 10 is zero, the account number is valid according to the algorithm.

#### Sample Data

* *Valid*: 5541808923795240, 4024007136512380, 6011797668867828
* *Invalid*: 5541801923795240, 4024007106512380, 6011797668868728

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
You will need to have `ruby 3.2.2` installed to run this program.

### Installing & Running
1. Fork and clone this repo down to your local machine. Then run:
```
bundle install
```
3. To run the program from the terminal, run the runner file with the input file path and output file path as arguments. The format of the run command is: `ruby lib/runner.rb 'input_file_path.txt' 'output_file_path.txt'`

Here is an example that can be copied/pasted into the terminal for a sample successful run:
```
ruby lib/runner.rb 'spec/fixtures/sample_digits.txt' 'write_file/sample_output.txt'
```
5. When the program runs successfully, you will get the output below:
<img width="485" alt="Screenshot 2024-12-02 at 7 38 32 AM" src="https://github.com/user-attachments/assets/0e06229e-104e-4ab9-bead-253fc94157e4">

### Running the tests
To run the test suite, type the following command in the console:
```
rspec spec
```
To view a dashboard coverage report generated by simplecov, run:
```
coverage/index.html
```
## About the Codebase
This section provides some context on the design decisions.

### Application Structure
The application is written using 1 module and 1 class that are called from a runner file. The module, named module CreditOcr, parses the pipe and underscore numbers into digits. The class, named module CardNumber, validates the digits as a credit card number. The module and class each have different functionalities and allow some flexibility in their usage. (i.e. a .txt file of credit cards numbers not produced from the CreditOcr module would be able to easily run through the checksum calculation portion of the application.)

This design choice also allows for future development or adjustments on either side of the process.

This application uses both a Functional Programming paradigm and an Object Oriented Programming paradigm as an exploration exercise in seeing both paradigm's pros and cons.

## Authors
This repo was written by Cory Bretsch, partially inspired by Turing School of Software and Design.
