import os
import subprocess
from datetime import datetime, timezone

# Get the list of modified files
result = subprocess.run(['git', 'diff', '--name-only', 'HEAD~1'], stdout=subprocess.PIPE)
modified_files = result.stdout.decode('utf-8').split()

# Debugging: Print the list of modified files
print("Modified files:", modified_files)

# Filter for Markdown files
modified_md_files = [f for f in modified_files if f.endswith('.md')]

# Debugging: Print the list of modified Markdown files
print("Modified Markdown files:", modified_md_files)

# Current date
current_date = datetime.now(timezone.utc).strftime('%Y-%m-%d')

# Function to update the last modified date in a file
def update_date_in_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    updated = False
    with open(file_path, 'w') as file:
        for line in lines:
            if line.startswith('Last updated:'):
                file.write(f'Last updated: {current_date}\n')
                updated = True
            else:
                file.write(line)
        if not updated:
            file.write(f'\nLast updated: {current_date}\n')

# Check if there are any modified Markdown files
if not modified_md_files:
    print("No modified Markdown files found.")
    exit(0)

# Update the date in each modified Markdown file
for file_path in modified_md_files:
    print(f"Updating file: {file_path}")  # Debugging: Print the file being updated
    update_date_in_file(file_path)

# Add and commit changes
subprocess.run(['git', 'add', '-A'])
subprocess.run(['git', 'commit', '-m', 'Update last modified date in Markdown files'])
