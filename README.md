# Prime Number Challenge

The PDF of the challenge has been included, and I'd like to note what I believe is an ambiguity in the instructions.

> The first row and column of the table should have the 10 primes, with
> each cell containing the product of the primes for the corresponding row and
> column.

When talking about the rows and columns of tables, I'm used to thinking of them as being part of the body of the table,
with headers and row labels being regarded separately. The resulting table ends up without the blank cell at 0,0 required
for multiples of 2 to render in either direction.

So I noted the discrepency in the test doc, and went ahead and set it up to render the primes as labels, and the products as cell values.