bind \cH backward-kill-path-component
bind "[3;5~" kill-word

function backup --argument filename
    cp $filename $filename.bak
end

function restore --argument file
    mv $file (echo $file | sed s/.bak//)
end
