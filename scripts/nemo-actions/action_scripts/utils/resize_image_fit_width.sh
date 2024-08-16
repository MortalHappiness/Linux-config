#!/usr/bin/env bash

input="${1}"
output="${2}"
width="${3}"

if [ "${output##*.}" == "webp" ] && [ "${input##*.}" == "png" ]; then
    convert "${input}" -resize "${width}x" -define 'webp:lossless=true' -quality 100 -strip "${output}"
else
    convert "${input}" -resize "${width}x" -strip "${output}"
fi

if [ $? -ne 0 ]; then
    notify-send "Failed to resize image" "Failed to resize image ${input} to width ${width}"
    exit 1
fi
