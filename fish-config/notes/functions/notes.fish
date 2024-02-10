function notes --description 'Note-taking with fzf and glow'
  # Check dependencies
  if not type -q fzf
    echo "fzf: command not found" 1>&2
    return 127
  end
  if not type -q glow
    echo "glow: command not found" 1>&2
    return 127
  end

  # Help message
  set -l help_msg "\
  Note-taking with fzf and glow

Usage:
  notes [flags]
  notes [command]

Available Commands:
  add     Add notes
  cd      Go to notes folder

Flags:
  -h, --help  Show this help message

Keyboard shortcuts in fzf:
  enter   Open with glow
  E       Open with editor
  K       Scroll preview Up
  J       Scroll preview down"

  # Handle environment variables
  if test -z "$NOTES_DIR"
    set -f notes_dir "$HOME/Documents/notes"
  else
    set -f notes_dir $NOTES_DIR
  end

  # Handle arguments
  set -l argc (count $argv)
  if test $argc -eq 0
    __notes_find $notes_dir
  else if test $argc -ge 1
    if [ $argv[1] = "-h" ]; or [ $argv[1] = "--help" ]
      echo $help_msg
      return 0
    else if [ $argv[1] = "add" ]
      if test $argc -eq 1
        echo "Usage: notes add <note_name>" 1>&2
        return 1
      else
        __notes_add $notes_dir $argv[2]
      end
    else if [ $argv[1] = "cd" ]
      __notes_cd $notes_dir
    else
      echo "$argv[1]: no such command or flag" 1>&2
      echo $help_msg 1>&2
      return 1
    end
  end
end
