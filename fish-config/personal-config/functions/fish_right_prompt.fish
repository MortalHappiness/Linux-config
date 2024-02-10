# fish theme: mint

function fish_right_prompt
  set -l normal (set_color normal)

  # Display custom prefix
  if functions -q fish_right_prompt_custom_prefix
    fish_right_prompt_custom_prefix
  end

  # Display date
  echo -n -s $normal ' [' (date +%H:%M:%S) ']'
end
