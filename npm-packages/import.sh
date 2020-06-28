input_path=`dirname $(realpath $0)`
input_file="$input_path/_packages"
xargs npm install --global < $input_file
