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
