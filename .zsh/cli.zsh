parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ (\1)/p'
}
setopt PROMPT_SUBST
export PROMPT='%F{green}%1d%f%F{red}$(parse_git_branch)%f:~$ '
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.npm-packages/bin"
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/Library/Python/3.9/bin
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/java/lombok.jar"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
