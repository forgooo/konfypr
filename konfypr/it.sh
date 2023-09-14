#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <source_file.cpp>"
  exit 1
fi

source_file="$1"

# Check if the source file exists
if [ ! -f "$source_file" ]; then
  echo "Error: File $source_file does not exist."
  exit 1
fi

# Use grep with a more comprehensive regex to find identifiers
# This regex covers common C/C++ identifier naming conventions
identifiers=$(grep -o -E '\b[a-zA-Z_][a-zA-Z0-9_]*\b' "$source_file")

# Print the unique identifiers
echo "$identifiers" | sort -u

