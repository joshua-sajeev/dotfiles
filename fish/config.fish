if status is-interactive
    # Commands to run in interactive sessions can go here
end
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin $PATH"
export NVM_DIR="$HOME/.nvm"
set -g fish_greeting
starship init fish | source

#if not pgrep startx >/dev/null
#    startx
#end
# Created by `pipx` on 2024-07-22 07:44:06
set PATH $PATH /home/joshua/.local/bin
set -U fish_user_paths /usr/local/go/bin $fish_user_paths
set -x GOPATH $HOME/go
set -x SSLKEYLOGFILE $HOME/go/golang_projects/web-app-book/ch5/sslkeys.log
set PATH $GOPATH/bin $PATH


set -x PATH /usr/local/pgsql/bin $PATH
set -Ux LD_LIBRARY_PATH /usr/local/pgsql/lib $LD_LIBRARY_PATH
