#!/usr/bin/env bash

input_file="${1}"
mount_path="${HOME}/r2-static"
r2_url="https://static.chishengliu.com"
r2_path="${r2_url}${input_file#${mount_path}}"

echo "${r2_path}" | xclip -selection clipboard
