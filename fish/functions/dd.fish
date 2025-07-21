function dd --wraps='cd ~/Downloads' --wraps='cd ~/Downloads && ls' --description 'alias dd cd ~/Downloads && ls'
  cd ~/Downloads && ls $argv
        
end
