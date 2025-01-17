
#Instant load
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use a different p10k config depending on the terminal
if zmodload zsh/terminfo && (( terminfo[colors] >= 256 )); then
    [[ ! -f /etc/p10k/p10k.zsh ]] || source /usr/etc/p10k/p10k.zsh
else
    [[ ! -f /etc/p10k/p10k-portable.zsh ]] || source /usr/etc/p10k/p10k-portable.zsh
fi

# Completion style
autoload -Uz compinit
compinit
zstyle ':completion:*:sudo:*' command-path $PATH
zstyle ':completion:*' menu select
autoload -Uz select-word-style
select-word-style bash

#Plugins
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh-sudo/sudo.plugin.zsh
source /usr/share/fzf/shell/key-bindings.zsh
source /usr/share/enhancd/init.sh

#Aliases
alias t="tree"
alias ~="cd ~"
alias back="cd -"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
##LS(d)
alias l="lsd -Ll"
alias ll="lsd -la"
#trash-cli
alias tp=trash-put
alias tl=trash-list
alias te=trash-empty
alias tres=trash-restore
alias trm=trash-rm
#Reminders to use trash-put instead of rm
alias rm="printf 'You sure you want to use rm instead of tp\? If so, use a backslash before rm'; false"
alias rmdir="printf 'You sure you want to use rm instead of tp\? If so, use a backslash before rmdir'; false"
