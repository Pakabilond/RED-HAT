#!/bin/bash

# List of usernames
users=("joseph" "junior" "eunice" "chloe")

# Default password
default_password="DefaultPass123"

# Loop to add users
for user in "${users[@]}"; do
  # Add the user
  sudo useradd "$user"
  
  # Set the default password
  echo "$user:$default_password" | sudo chpasswd
  
  # Force password change on first login
  sudo passwd --expire "$user"
  
  echo "User $user added with default password and password expiration set."
done