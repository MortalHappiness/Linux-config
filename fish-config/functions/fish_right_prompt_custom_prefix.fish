function fish_right_prompt_custom_prefix
  if command -q pyenv
    set virtualenv_name (pyenv version-name)
    echo -n "(pyenv:$virtualenv_name) "
  end
  if command -q goenv
    set virtualenv_name (goenv version-name)
    echo -n "(goenv:$virtualenv_name) "
  end
end
