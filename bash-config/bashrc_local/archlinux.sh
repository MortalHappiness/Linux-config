export HISTSIZE=5000
export HISTFILESIZE=5000
export TERMINFO=/usr/share/terminfo
export PATH="$PATH:$HOME/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mortalhappiness/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mortalhappiness/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mortalhappiness/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mortalhappiness/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# nvm
source /usr/share/nvm/init-nvm.sh

# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mortalhappiness/google-cloud-sdk/path.bash.inc' ]; then . '/home/mortalhappiness/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mortalhappiness/google-cloud-sdk/completion.bash.inc' ]; then . '/home/mortalhappiness/google-cloud-sdk/completion.bash.inc'; fi
