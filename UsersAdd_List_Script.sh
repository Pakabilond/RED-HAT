#!/bin/bash

# Path to the user list file
user_list="user_list.txt"

# Default password
default_password="DefaultPass123"

# Check if the user list file exists
if [[ ! -f "$user_list" ]]; then
  echo "User list file '$user_list' not found!"
  exit 1
fi

# Loop through each line in the file (name and surname)
while IFS=' ' read -r name surname; do
  # Generate the username by combining the first letter of the name with the surname
  username="${name:0:1}${surname}"
  
  # Add the user
  sudo useradd "$username"
  
  # Set the default password
  echo "$username:$default_password" | sudo chpasswd
  
  # Force password change on first login
  sudo passwd --expire "$username"
  
  echo "User $username added with default password and password expiration set."
done < "$user_list"
