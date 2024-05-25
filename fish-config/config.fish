set -xg EDITOR vim
umask 022
set fish_greeting

set -g fish_key_bindings fish_hybrid_key_bindings

# ========================================
# Aliases

if type -q bat
  alias cat="bat"
else if type -q batcat
  alias bat="batcat"
  alias cat="batcat"
end

if type -q fdfind
  alias fd="fdfind"
end

if type -q dust
  alias du="dust"
end

if type -q duf
  alias df="duf"
end

if type -q eza
  alias ls="eza -F"
  alias ll="eza -F --long --header --group"
  alias la="eza -F --long --header --group --all"
end

if type -q rg
  alias grep="rg"
end

if type -q lazygit
  alias lg="lazygit"
end

# Markdown editor
if type -q frogmouth
  alias md="frogmouth"
end

# ========================================
# External tools

# fzf
if type -q fzf
  set -x FZF_DEFAULT_OPTS '
    --layout=reverse
    --color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672
  '
end

# fzf.fish
if functions -q fzf_configure_bindings
  fzf_configure_bindings --directory=\cf --git_log= --git_status= --processes= --variables=\e\cv
end

# zoxide
if type -q zoxide
  zoxide init fish --cmd cd | source
end

# thefuck
if type -q thefuck
  thefuck --alias | source
end

# asdf
if test -d $HOME/.asdf
  source ~/.asdf/asdf.fish
end
if test -d $HOME/.asdf/plugins/golang
  source ~/.asdf/plugins/golang/set-env.fish
end

# navi
if type -q navi
  navi widget fish | source
end

# ========================================
# Personal tools

if functions -q __auto_source_venv
  __auto_source_venv
end

# ========================================
# Include local config

set -l local_config_file "$__fish_config_dir/config.local.fish"
if test -f $local_config_file
  source $local_config_file
end
