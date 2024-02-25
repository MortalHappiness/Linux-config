function notes
  set -f notes_dir $HOME/pCloudDrive/BACKUP/notes

  set -f filename_color '\\033[0;35m'
  set -f no_color '\\033[0m'

  set -f generate_line_cmd 'echo -n $(basename "{}")":"; cat "{}" | tr "\n" " "; echo'
  set -f preview_cmd "echo {1}; printf '%.s─' (seq 1 (tput cols)) ; glow -s dracula $notes_dir/{1}"
  set -f view_cmd "frogmouth $notes_dir/{1}"
  set -f edit_cmd "$EDITOR $notes_dir/{1}"

  find "$notes_dir" -maxdepth 1 -type f -name "*.md" -print0 | xargs -0 -I {} sh -c "$generate_line_cmd" |
    fzf --delimiter : \
        --with-nth 2.. \
        --preview "$preview_cmd" \
        --preview-window='~2' \
        --bind "J:preview-down,K:preview-up,enter:execute($view_cmd),E:execute($edit_cmd)"
end
