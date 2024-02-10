# fish theme: mint

function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end

function _git_status
  set -l git_status (git status --porcelain 2> /dev/null | string collect)
  if test -n "$git_status"
    if echo $git_status | grep '^.[^ ]' >/dev/null
      echo 'dirty'
    else
      echo 'staged'
    end
  else
    echo 'clean'
  end
end

function fish_prompt
  set -l last_status $status

  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l green (set_color green)
  set -l cyan_bold (set_color --bold cyan)
  set -l red_bold (set_color --bold red)
  set -l blue_bold (set_color --bold blue)
  set -l green_bold (set_color --bold green)

  set -l cwd (pwd | sed -e "s!^$HOME!~!g")

  # If we're running via SSH, change the host color.
  set -l color_host $green_bold
  if set -q SSH_TTY
    set color_host $red_bold
  end

  # Output the prompt, left to right

  # Display custom prefix
  if functions -q fish_prompt_custom_prefix
    fish_prompt_custom_prefix
  end

  # Display 'user@host:'
  echo -n -s $green_bold (whoami) $color_host @ (hostname) $normal ':'

  # Display the current directory name
  echo -n -s $blue_bold $cwd $normal

  # Show git branch and status
  set -l git_branch (_git_branch_name)
  if test -n "$git_branch"
    switch (_git_status)
      case 'dirty'
        set git_info $red $git_branch
      case 'staged'
        set git_info $green $git_branch
      case 'clean'
        set git_info $cyan_bold $git_branch
    end
    echo -n -s ' (' $git_info $normal ')'
  end

  # Print last exit code if nonzero:
  if test $last_status -ne 0
    echo -n -s ' ' $red '[' $red_bold
    printf '%d' $last_status
    echo -n -s $normal $red ']' $normal
  end

  # Terminate with a nice prompt char:
  echo -n -s $normal '$ '
end
