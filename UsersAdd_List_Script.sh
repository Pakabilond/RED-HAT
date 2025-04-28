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

# Loop through each username in the file
while IFS= read -r user; do
  # Add the user
  sudo useradd "$user"
  
  # Set the default password
  echo "$user:$default_password" | sudo chpasswd
  
  # Force password change on first login
  sudo passwd --expire "$user"
  
  echo "User $user added with default password and password expiration set."
done < "$user_list"
