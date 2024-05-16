function cc --wraps=rofi\ -show\ calc\ -modi\ calc\ -no-show-match\ -no-sort\ -calc-command\ \'echo\ -n\ \{result\}\ \|\ xclip\ -selection\ clipboard\' --description alias\ cc\ rofi\ -show\ calc\ -modi\ calc\ -no-show-match\ -no-sort\ -calc-command\ \'echo\ -n\ \{result\}\ \|\ xclip\ -selection\ clipboard\'
  rofi -show calc -modi calc -no-show-match -no-sort -calc-command 'echo -n {result} | xclip -selection clipboard' $argv
        
end
