# Credit Check
This application parses numbers written using pipes and underscores into actual numbers, then validates each credit card number through a checksum calculation, labeling each policy number as valid, in-valid (ERR), or illegible (ILL). Any pipe and underscore number that is not recognized as a digit is replaced with a question mark (?). Both the input and output of this application are .txt files.

A visual of the input .txt file, containing the credit card's numbers using pipes and underscores, looks like:

Screenshot 2024-12-02 at 7 49 32 AM
A visual of the output .txt file, containing the parsed policy numbers with their validation code, looks like:
Screenshot 2024-12-02 at 7 52 49 AM
The checksum calculation algorithm used to validate each policy number is:
Screenshot 2024-12-02 at 7 54 17 AM

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
You will need to have `ruby 3.2.2` installed to run this program.

### Installing & Running
1. Fork and clone this repo down to your local machine. Then run: `bundle install`
2. To run the program from the terminal, run the runner file with the input file path and output file path as arguments. The format of the run command is: ruby lib/runner.rb 'input_file_path.txt' 'output_file_path.txt
Here is an example that can be copied/pasted into the terminal for a sample successful run:
`ruby lib/runner.rb 'spec/fixtures/sample_digits.txt' 'write_file/sample_output.txt'`
3. When the program runs successfully, you will get the output below:
Screenshot 2024-12-02 at 7 38 32 AM

### Running the tests
To run the test suite, type the following command in the console:
rspec spec
To view a dashboard coverage report generated by simplecov, run:
coverage/index.html

## About the Codebase
This section provides some context on the design decisions.

### Application Structure
The application is written using 2 modules that are called from a runner file. The first module, named module PolicyOcr, parses the pipe and underscore numbers into digits. The second module, named module PolicyNumber, validates the digits as a policy number. The two modules have different functionalities and allow some flexibility in their usage. (i.e. a .txt file of policy numbers not produced from the PolicyOcr module would be able to easily run through the checksum calculation portion of the application.)

This design choice also allows for future development or adjustments on either side of the process.

This application uses a Functional Programming paradigm, thus I chose to use Modules. This application could have been coded with Classes and an OOP approach just as easily with the same outcome.

The codebase itself is explicit to allow the reader to follow the logic easily. Ex. the code uses .each over .map, and avoids chaining methods for readability.

## Authors
This repo was written by Cory Bretsch.

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

If helpful, you can use the following sample data:

* *Valid*: 5541808923795240, 4024007136512380, 6011797668867828
* *Invalid*: 5541801923795240, 4024007106512380, 6011797668868728

