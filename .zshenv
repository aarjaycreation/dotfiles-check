#This is used to reload the instance
TRAPUSR1() {
    if [[ -o INTERACTIVE ]]; then
        exec "${SHELL}"
    fi
}
if [[ $(uname) == "Darwin" ]]; then
    export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
fi
export LIBVA_DRIVER_NAME=nvidia
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
