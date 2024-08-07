import pandas as pd

# Define the data for the DataFrame
data = {
    'account_id': [516, 123, 1, 7896, 3152, 527],
    'standard_qty': [10, 15, 7, 20, 12, 5],
    'occurred_at': ['2024-01-01', '2024-01-15', '2024-02-01', '2024-03-01', '2024-03-15', '2024-04-01']
}

# Create the DataFrame
df = pd.DataFrame(data)

# Convert 'occurred_at' to datetime
df['occurred_at'] = pd.to_datetime(df['occurred_at'])

# Display the DataFrame
print(df)
