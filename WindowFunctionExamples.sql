row_number()	bigint	number of the current row within its partition, counting from 1
rank()			bigint	rank of the current row within its partition, counting from
dense_rank()	bigint	rank of the current row without gaps; this function counts peer groups
percent_rank()	double precision	relative rank of the current row: (rank - 1) / (total rows - 1)
cume_dist()	double precision	relative rank of the current row: (number of rows preceding or peer with current row) / (total rows)
ntile(num_buckets integer)	integer	integer ranging from 1 to the argument value, dividing the partition as equally as possible
first_value(value any)	same type as value	returns value evaluated at the row that is the first row of the window frame
last_value(value any)	same type as value	returns value evaluated at the row that is the last row of the window frame
nth_value(value any, nth integer)	same type as value	returns value evaluated at the row that is the nth row of the window frame (counting from 1); null if no such row

-- All of the functions listed above depend on the sort ordering specified by the ORDER BY clause of the associated window definition.
--  Rows that are not distinct in the ORDER BY ordering are said to be peers; the four ranking functions are defined so that they give the same answer for any two peer rows.