function fish_prompt_custom_prefix
  if command -q pyenv
    set virtualenv_name (pyenv version-name)
    echo -n "(pyenv:$virtualenv_name) "
  end
end
