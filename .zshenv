#This is used to reload the instance
TRAPUSR1() {
    if [[ -o INTERACTIVE ]]; then
        exec "${SHELL}"
    fi
}

# Add paths
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="/Users/afonso/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="$HOME/.miniforge3/bin:$PATH"
export PATH="/opt/homebrew/opt/texlive/bin/:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

