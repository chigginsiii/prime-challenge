require './prime_table'
require 'prime'

RSpec.describe PrimeTable do

  subject do
    table = PrimeTable.new(5)
    table
  end

  it { should be_instance_of(PrimeTable) }
  it { should respond_to(:primes) }
  it { should respond_to(:rows) }
  it { should respond_to(:text_table) }

  describe '#new' do
    pt = PrimeTable.new(5)
    it 'generates first 5 primes' do
      expect(pt.primes).to eq([2,3,5,7,11])
    end
  end

  describe '#text_table' do
    it 'creates prime multiple table' do
      table  = PrimeTable.new(5).text_table
      expect(table).to eq(test_table_too)
    end
  end

end

# okay, I've decided the chances that we're looking
# looking for this table:
def test_table
  return <<HERE;
  2   3   5   7  11
  3   9  15  21  33
  5  15  25  35  55
  7  21  35  49  77
 11  33  55  77 121
HERE
end

# ...instead of this table:
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

# ...is really remote. If test_table's truly what we're looking for,
# rollback to commit 07e3b34c4c8ae82 and it'll produce test_table.
