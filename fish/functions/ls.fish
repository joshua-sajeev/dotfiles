function ls --wraps='exa -l' --wraps='exa -lg --icons' --description 'alias ls exa -lg --icons'
  exa -lg --icons $argv
        
end
