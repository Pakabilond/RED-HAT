#!/bin/bash

# Path to the user list file
user_list="user_list.txt"

# Check if the user list file exists
if [[ ! -f "$user_list" ]]; then
  echo "User list file '$user_list' not found!"
  exit 1
fi

# Loop through each line in the file (name and surname)
while IFS=' ' read -r name surname; do
  # Generate the username by combining the first letter of the name with the surname
  username="${name:0:1}${surname}"
  
  # Delete the user
  sudo userdel -r "$username"
  
  echo "User $username deleted successfully!"
done < "$user_list"
