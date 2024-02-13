#This is used to reload the instance
TRAPUSR1() {
    if [[ -o INTERACTIVE ]]; then
        exec "${SHELL}"
    fi
}
