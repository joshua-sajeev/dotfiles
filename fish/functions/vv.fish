function vv --wraps='source .venv/bin/activate.fish' --wraps='source ~/projects/main/.venv/bin/activate.fish' --description 'alias vv source ~/projects/main/.venv/bin/activate.fish'
  source ~/projects/main/.venv/bin/activate.fish $argv
        
end
