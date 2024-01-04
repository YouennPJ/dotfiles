parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ (\1)/p'
}
setopt PROMPT_SUBST
export PROMPT='%F{green}%1d%f%F{red}$(parse_git_branch)%f:~$ '
export PATH="$PATH:/opt/homebrew/bin"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
