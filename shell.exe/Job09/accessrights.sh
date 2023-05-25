#!/bin/bash

# CSV file path
csv_file="users.csv"

# Function to create a user with superuser role
create_superuser() {
  username="$1"

  # Create the user
  sudo useradd -m "$username"

  # Assign superuser (root) role to the user
  sudo usermod -aG wheel "$username"

  echo "User '$username' created with superuser role."
}

# Function to create a regular user
create_regular_user() {
  username="$1"

  # Create the user
  sudo useradd -m "$username"

  echo "Regular user '$username' created."
}

# Main script logic

# Check if the CSV file exists
if [ ! -f "$csv_file" ]; then
  echo "CSV file '$csv_file' not found."
  exit 1
fi

# Read the CSV file line by line
while IFS=',' read -r username role
do
  # Skip the header line
  if [[ "$username" == "Username" ]]; then
	continue
  fi

  # Check if the user already exists
  if id "$username" &>/dev/null; then
	echo "User '$username' already exists. Skipping..."
	continue
  fi

  # Create user based on the role
  if [[ "$role" == "admin" ]]; then
	create_superuser "$username"
  else
	create_regular_user "$username"
  fi

done < "$csv_file"

# Set up Cron job to monitor changes in the CSV file
(crontab -l 2>/dev/null; echo "* * * * * /home/robbie/accessrights.sh") | crontab -

echo "Access rights script executed. Cron job set up to monitor changes in the CSV file."
