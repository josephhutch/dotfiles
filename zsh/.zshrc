HISTSIZE=50000
SAVEHIST=50000

setopt hist_ignore_dups hist_ignore_space extended_history share_history
setopt interactive_comments

# setup antidote
source "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/antidote/share/antidote/antidote.zsh"
antidote load

source <(fzf --zsh)

eval "$(mise activate zsh)"
