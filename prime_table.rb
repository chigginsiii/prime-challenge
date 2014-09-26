class PrimeTable

  # at some point, this should probably get a class var
  # to hold the primes found so far (perhaps an array, eh)
  # so the next time through, we'll already know we've got
  # first N primes taken care of.

  def initialize (num_primes = 1)
    @num_primes = num_primes
  end

  def primes
    @primes ||= _generate_primes
    @primes
  end

  def text_table
    @table ||= _generate_table
    @table
  end

  private

  def _generate_primes
    # in the simplest scenario...
    primes = [2]
    return primes if @num_primes == 1

    # okidoke, let's make some primes then
    test_num = 3
    while primes.count < @num_primes
      max_factor = Math.sqrt(test_num).floor
      if primes.select {|num| num <= max_factor }.none? {|num| test_num % num == 0 }
        primes.push(test_num)
      end
      test_num += 2
    end

    return primes
  end

  def _generate_rows
    rows = []
    primes.each_with_index do |row_prime, row_i|
      rows[row_i] = []
      primes.each_with_index do |col_prime, col_i|
        rows[row_i][col_i] = row_prime * col_prime
      end
      # add the col label
      rows[row_i].unshift(row_prime)
    end

    # header!
    rows.unshift(['', *primes])
    return rows
  end

  def _generate_table
    rows = _generate_rows
    maxwidth = _calc_widths(rows)
    format = rows[0].map { '%' + maxwidth.to_s + 's' }.join(' ') + "\n"

    return rows.reduce('') do |table, row|
      table += sprintf( format, *row.map {|x| x.to_s })
    end
  end

  def _calc_widths (rows)
    max_width = 0
    rows.each do |row|
      row.each do |num|
        max_width = num.to_s.size if num.to_s.size > max_width
      end
    end
    return max_width
  end

end
