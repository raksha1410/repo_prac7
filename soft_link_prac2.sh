#!/bin/bash

# Replace "soft_link.txt" with the name of your soft link
soft_link="/home/raksha/soft_link.txt"

# Replace "target_file.txt" with the name of the target file for the soft link
target_file="/home/raksha/target_file.txt"

# Check if the soft link exists and is valid
if [ -L "$soft_link" ] && [ -e "$soft_link" ]; then
          echo "The soft link '$soft_link' points to: $(readlink -f "$soft_link")"
          # Perform any operations with the target file here
  else
          echo "The soft link '$soft_link' is missing or broken."
          # Check if the target file exists
          if [ -e "$target_file" ]; then
                  # Create the soft link
                  ln -s "$target_file" "$soft_link"
                  echo "Soft link '$soft_link' has been created and now points to '$target_file'."
          else
                  echo "Unable to create the soft link as the target file '$target_file' is missing."
          fi
fi
