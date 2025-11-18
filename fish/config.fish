set -g fish_greeting
starship init fish | source
zoxide init fish | source
export NVM_DIR="$HOME/.nvm"

# Created by `pipx` on 2025-07-28 15:42:43
# --- NVM PATH ---
set -gx PATH $HOME/.local/share/nvm/v25.2.1/bin $PATH

# --- Local binaries ---
set -gx PATH $HOME/.local/bin $PATH

# --- Go environment ---
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN
