function dd --wraps='cd ~/Downloads && lsd' --wraps='cd ~/Downloads && exa -al' --description 'alias dd cd ~/Downloads && exa -al'
  cd ~/Downloads && exa -al $argv
        
end
