import os
import pandas as pd

# Create an empty dataframe to store the combined data
combined_df = pd.DataFrame(columns=['cpu', 'real', 'situation'])

# Path to the directory containing the CSV files
directory_path = os.curdir

for filename in os.listdir(directory_path):
    if filename.endswith('.csv'):
        file_path = os.path.join(directory_path, filename)
        
        # Read the CSV file into a dataframe
        csv_data = pd.read_csv(file_path)
        
        # Extract the "real" and "cpu" columns from the CSV data
        real_data = csv_data['real']
        cpu_data = csv_data['cpu']
        
        # Create a dataframe for the current file's data
        situation = filename.split('.')[0] # remove the ".csv"
        file_df = pd.DataFrame({'cpu': cpu_data, 'real': real_data, 'situation': [situation] * len(csv_data)})
        
        # Append the current file's data to the combined dataframe
        combined_df = combined_df._append(file_df, ignore_index=True)

# Save the combined dataframe to a CSV file
combined_df.to_csv('data.csv', index=False)
