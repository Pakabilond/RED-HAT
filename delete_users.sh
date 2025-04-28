#!/bin/bash

# List of usernames to delete
users=("user1" "user2" "user3")

# Loop to delete users
for user in "${users[@]}"; do
  sudo userdel -r "$user"
  echo "User $user deleted successfully!"
done
