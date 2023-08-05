#!/bin/bash

# Replace "soft_link.txt" with the name of your soft link
soft_link="soft_link.txt"

# Function to check if the target file exists
function is_target_file_exists {
  target_file=$(readlink "$soft_link")
  if [ -e "$target_file" ]; then
    return 0
  else
    return 1
  fi
}

# Check if the soft link exists and is valid
if is_target_file_exists; then
  echo "The soft link '$soft_link' points to: $target_file"
  # Perform any operations with the target file here
else
  echo "The soft link '$soft_link' is missing or broken."

  # Replace "target_file.txt" with the name of the target file
  target_file="target_file.txt"

  # Create the soft link if the target file exists
  if [ -e "$target_file" ]; then
    ln -s "$target_file" "$soft_link"
    echo "Soft link '$soft_link' has been fixed and now points to '$target_file'."
  else
    echo "Unable to fix the soft link as the target file '$target_file' is also missing."
  fi
fi
