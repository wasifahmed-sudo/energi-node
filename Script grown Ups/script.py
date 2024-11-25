# This Python script processes a contact information file, performing these key functions:

# Reads contact data from a text file
# Separates names and email addresses
# Converts email addresses to lowercase
# Sorts names and emails alphabetically
# Writes sorted names to 'names.txt'
# Writes sorted emails to 'emails.txt'

# The script includes error handling to manage:

# Empty lines
# Improperly formatted input
# Missing separators

# # This code was developed with help from Claude AI

def process_contacts(input_file):
    names = []
    emails = []

    # Read the input file
    with open(input_file, 'r') as f:
        for line in f:
            # Trim whitespace
            line = line.strip()
            
            # Skip empty lines
            if not line:
                continue
            
            # Split the line by ':'
            parts = line.split(':')
            
            # Validate input
            if len(parts) < 2:
                print(f"Skipping invalid line: {line}")
                continue
            
            # Extract name and email
            name = parts[0].strip()
            email = parts[1].strip().lower()  # Convert emails to lowercase
            
            names.append(name)
            emails.append(email)

    # Sort names and emails alphabetically while maintaining original case
    sorted_names = sorted(names)
    sorted_emails = sorted(emails)

    # Write names to names.txt
    with open('names.txt', 'w') as f:
        for name in sorted_names:
            f.write(name + '\n')

    # Write email addresses to emails.txt
    with open('emails.txt', 'w') as f:
        for email in sorted_emails:
            f.write(email + '\n')

    print("Processing complete. Check names.txt and emails.txt")

# Usage
process_contacts('data.txt')


