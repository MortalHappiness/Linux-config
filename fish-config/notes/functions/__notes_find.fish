function __notes_find
  set -l notes_dir $argv[1]
  set -l glow_cmd 'glow -s dracula'

  if test -z "$NOTES_MD_VIEWER"
    set -f md_view_cmd "$glow_cmd"
  else
    set -f md_view_cmd $NOTES_MD_VIEWER
  end

  find $argv[1] -iname '*.md' -exec basename -s .md {} \; |
    fzf --bind "J:preview-down,K:preview-up,enter:become($md_view_cmd $notes_dir/{}.md),E:become($EDITOR $notes_dir/{}.md)" --preview "$glow_cmd $notes_dir/{}.md"
end
