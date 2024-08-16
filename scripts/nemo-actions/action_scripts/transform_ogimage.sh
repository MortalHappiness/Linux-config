#!/usr/bin/env bash

script_path="$(dirname "$(readlink -f "$BASH_SOURCE[0]")")"
input_file="${1}"
folder=$(dirname "${input_file}")
extension="${input_file##*.}"
output_file=$(mktemp --suffix=".${extension}")

if [ -e "${folder}/cover" ]; then
    notify-send "Transform to ogimage" "${folder}/cover already exists"
    exit 1
fi
mkdir -p "${folder}/cover"

$script_path/utils/resize_image_fit_width.sh "${input_file}" "${output_file}" 1200

if [ $? -eq 0 ]; then
    mv "${output_file}" "${input_file}"
else
    notify-send "Transform to ogimage" "Failed to resize image ${input_file} to width 1200"
    exit 1
fi

mv "${input_file}" "${folder}/cover.${extension}"
input_file="${folder}/cover.${extension}"
for size in 360 480 720 1080 1200; do
    output_file="${folder}/cover/cover_${size}.webp"
    $script_path/utils/resize_image_fit_width.sh "${input_file}" "${output_file}" "${size}"
    if [ $? -ne 0 ]; then
        notify-send "Transform to ogimage" "Failed to resize image ${input_file} to width ${size}"
        exit 1
    fi
done

mv "${input_file}" "${folder}/cover/"
