if status is-interactive
    # Commands to run in interactive sessions can go here
end
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin $PATH"
export NVM_DIR="$HOME/.nvm"
set -g fish_greeting


if not pgrep startx > /dev/null
    startx
end
# Created by `pipx` on 2024-07-22 07:44:06
set PATH $PATH /home/joshua/.local/bin

