import pandas as pd

# Sample DataFrame creation
data = {
    "Name": ["Anna", "Bob", "Charles", "David", "Edward"],
    "Age": [28, 34, 29, 42, 30],
    "City": ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]
}

df = pd.DataFrame(data)

# Display the first 5 rows of the DataFrame
print("First 5 entries in the DataFrame:")
print(df.head())
