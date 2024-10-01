# Import necessary libraries
import pandas as pd

# Load the CSV file
csv_file_path = "spotify_millsongdata.csv"
df = pd.read_csv(csv_file_path)

# Extract the 'text' column and output it to a text file
text_data = df['text'].dropna()

# Save the extracted text to a file, one per line
output_file_path = "spotify_text_output.txt"
text_data.to_csv(output_file_path, index=False, header=False, sep='\n')

# Provide the output file to the user
output_file_path
