output_path=`dirname $(realpath $0)`
output_file="$output_path/_packages"
npm list --global --parseable --depth=0 | sed '1d' | \
    awk '{gsub(/\/.*\//,"",$1); print}' \
    > $output_file
