class PrimeTable

  def generate_primes (n = 1)
    # in the simplest scenario...
    return [2] if n == 1
    supplemental = []
    # no evens!
    test_num = 3
    while supplemental.count < n - 1
      # if test is not factorable by the current primes...
      if supplemental.empty? or supplemental.none? { |prime| test_num % prime == 0 } 
        supplemental.push(test_num)
      end
      test_num += 2
    end
    # don't forget the deuce!
    return supplemental.unshift(2)
  end

  # this will likely change if XXX note in test is correct
  def generate_rows (primes = [])
    rows = []
    primes.each_with_index do |row_prime, row_i|
      rows[row_i] = []
      primes.each_with_index do |col_prime, col_i|
        if row_i == 0
          rows[row_i][col_i] = col_prime
        elsif col_i == 0
          rows[row_i][col_i] = row_prime
        else
          rows[row_i][col_i] = row_prime * col_prime
        end
      end
    end
    return rows
  end

  # out to term for now, will likely want to provide other
  # output methods or take formatting objects but this gets
  # us a pretty table.
  def generate_table (rows = [[]])
    _out_to_text(rows)
  end

  private

  def _calc_widths (rows)
    # thought about a max_width for each col, but lets start with
    # every cell being the same
    max_width = 0

    # this can be tersified by composing, but i prefer readability at this point
    rows.each do |row|
      row.each do |num|
        max_width = num.to_s.size if num.to_s.size > max_width
      end
    end
    return max_width
  end

  def _out_to_text (rows)
    # line format
    maxwidth = _calc_widths(rows)
    format = rows[0].map { '%' + maxwidth.to_s + 's' }.join(' ') + "\n"
    # add them to a scalar and out to text
    return rows.reduce('') do |table, row|
      table += sprintf( format, *row.map {|x| x.to_s })
    end
  end

end
