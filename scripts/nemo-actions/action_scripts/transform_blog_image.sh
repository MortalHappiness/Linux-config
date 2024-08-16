#!/usr/bin/env bash

script_path="$(dirname "$(readlink -f "$BASH_SOURCE[0]")")"
input_file="${1}"
extension="${input_file##*.}"
temp_file=$(mktemp --suffix=".webp")
output_file="${input_file%.*}.webp"

$script_path/utils/resize_image_fit_width.sh "${input_file}" "${temp_file}" 960

if [ $? -eq 0 ]; then
    rm "${input_file}"
    mv "${temp_file}" "${output_file}"
else
    notify-send "Transform to ogimage" "Failed to resize image ${input_file} to width 720px."
    exit 1
fi
