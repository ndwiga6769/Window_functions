# Aggregates in Window Functions with and without ORDER BY
# The ORDER BY clause is one of two clauses integral to window 
# functions. The ORDER and PARTITION define what is referred to 
# as the “window”—the ordered subset of data over which calculations 
# are made. Removing ORDER BY just leaves an unordered partition; in our 
# query's case, each column's value is simply an aggregation (e.g., sum, 
# count, average, minimum, or maximum) of all the standard_qty values in 
# its respective account_id.