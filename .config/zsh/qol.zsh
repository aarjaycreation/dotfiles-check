# ~/.config/zsh/qol.zsh

backup() {
    cp $1 $1.bak
}

restore() {
    mv $1 $(echo $1 | sed 's/\.bak//')
}

capture() {
    sudo dtrace -p "$1" -qn '
        syscall::write*:entry
        /pid == $target && arg0 == 1/ {
            printf("%s", copyinstr(arg1, arg2));
        }
    '
}
