#!/bin/bash

# Get the current date and time
current_date=$(date +"%d-%m-%Y-%H:%M")

# Extract the number of connections from logs
number_connections=$(grep -c "session opened" /var/log/auth.log)

# Create a file with the number of connections and current date/time
filename="number_connection-$current_date"
echo "$number_connections" > "$filename"

# Create a backup sub-folder if it doesn't exist
backup_folder="Backup"
mkdir -p "$backup_folder"

# Archive the file using tar
tar -czf "$backup_folder/$filename.tar.gz" "$filename"

echo "Log file created and archived: $filename.tar.gz"
