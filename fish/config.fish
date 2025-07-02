export PATH="$HOME/.local/bin $PATH"
set -g fish_greeting
starship init fish | source

set -U fish_user_paths /usr/local/go/bin $fish_user_paths
set -x GOPATH $HOME/go
set PATH $GOPATH/bin $PATH


set -x PATH /usr/local/pgsql/bin $PATH
set -Ux LD_LIBRARY_PATH /usr/local/pgsql/lib $LD_LIBRARY_PATH
set -x PGDATA /home/postgres/
