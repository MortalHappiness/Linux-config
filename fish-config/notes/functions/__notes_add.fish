function __notes_add
  set -l notes_dir $argv[1]
  set -l note_name $argv[2]
  set -l filename "$notes_dir/$note_name.md"

  if test -f $filename
    echo "Notes $note_name already exists" 1>&2
    return 1
  else
    $EDITOR $filename
  end
end
