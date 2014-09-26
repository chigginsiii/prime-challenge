require './prime_table'
require 'prime'

RSpec.describe PrimeTable do

  describe '#new' do
    pt = PrimeTable.new()
    it { should be_instance_of(PrimeTable) }
    it { should respond_to(:generate_primes) }
    it { should respond_to(:generate_rows) }
    it { should respond_to(:generate_table) }
  end

  describe '#generate_primes' do
    let (:pt) { PrimeTable.new }

    describe 'when N = 1' do
      it 'returns a single element array' do
        primes = pt.generate_primes(1)
        expect(primes).to eq( Prime.first(1) )
      end
    end

    describe 'when N = 6' do
      it 'returns the first 6 primes' do
        primes = pt.generate_primes(6)
        expect(primes).to eq( Prime.first(6) )
      end
    end

  end

  describe '#generate_table' do
    let (:pt) { PrimeTable.new }
    
    it 'returns a row for each prime' do
      primes = pt.generate_primes(5)
      rows   = pt.generate_rows(primes)
      table  = pt.generate_table(rows)

      expect(table).to eq(test_table)
    end
  end

  # XXX: if I've understood the coding challenge correctly, the primes
  # are not headers/labels, but actual rows/cols, so there won't be
  # a 0.0 cell where the answer is 4, or a 0.1/1.0 with products of 6.

  # I imagine when I come back to the Product owner and show them the
  # the story and the result, she's going to say "oh, no we want the
  # products of 2 as well." But let's get this task passing tests and
  # we can return to formatting.

end

def test_table
  return <<HERE;
  2   3   5   7  11
  3   9  15  21  33
  5  15  25  35  55
  7  21  35  49  77
 11  33  55  77 121
HERE
end

# this is the table I _believe_ we're after, but we'll see after I
# hear back from the Product Owner.
def test_table_too
  return <<HERE;
      2   3   5   7  11
  2   4   6  10  14  22
  3   6   9  15  21  33
  5  10  15  25  35  55
  7  14  21  35  49  77
  9  18  27  45  63  99
 11  22  33  55  77 121
HERE
end

