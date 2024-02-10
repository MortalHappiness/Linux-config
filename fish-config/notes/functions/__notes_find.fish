function __notes_find
  set -l notes_dir $argv[1]

  set -l md_view_cmd 'glow -s dracula'

  find $argv[1] -iname '*.md' -exec basename -s .md {} \; |
    fzf --bind "J:preview-down,K:preview-up,enter:become($md_view_cmd $notes_dir/{}.md),E:become($EDITOR $notes_dir/{}.md)" --preview "$md_view_cmd $notes_dir/{}.md"
end
