function ff --wraps='nvim (fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")' --description 'alias ff nvim (fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")'
  nvim (fzf --preview "bat --color=always --style=numbers --line-range=:500 {}") $argv
        
end
