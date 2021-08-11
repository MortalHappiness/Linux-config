alias pip=pip3
alias python=python3

export PATH="$PATH:$HOME/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gem

export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
