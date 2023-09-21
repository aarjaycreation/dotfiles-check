bind \cH backward-kill-path-component
bind "[3;5~" kill-word

function backup --argument filename
    cp $filename $filename.bak
end

function restore --argument file
    mv $file (echo $file | sed s/.bak//)
end

function core
    xhost +local:root
    sudo docker exec -it core core-gui
end

function core-bash
    sudo docker exec -it core /bin/bash 
end

function launch-term --argument nodename
     sudo docker exec -it core xterm -bg black -fg white -fa 'DejaVu Sans Mono' -fs 16 -e vcmd -c /tmp/pycore.1/$nodename -- /bin/bash
end

