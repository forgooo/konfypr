#!/bin/bash
directory="$1"
declare -A file_hashes
declare -A file_duplicates

calculate_md5() {
  md5sum "$1" | awk '{print $1}'
}

find_and_process_files() {
  local current_directory="$1"
  cd "$current_directory" || exit
  for item in *; do
    if [ -f "$item" ]; then
      local file_hash
      file_hash=$(calculate_md5 "$item")
      if [ -n "${file_hashes[$file_hash]}" ]; then
        echo "Find copy of file: $item (file copy ${file_duplicates[$file_hash]})"
      else
        file_hashes["$file_hash"]=$item
      fi
      file_duplicates["$file_hash"]+=" $item"
    elif [ -d "$item" ]; then
      find_and_process_files "$item"
    fi
  done
  cd ..
}

find_and_process_files "$directory"
