function ls --wraps='exa -l' --wraps='exa -lg --icons' --wraps='exa -al --icons' --wraps='exa -l --icons' --description 'alias ls exa -l --icons'
  exa -l --icons $argv
        
end
