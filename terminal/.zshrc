### Template
# alias
alias ll='ls -al'
alias zshrc='cp ~/.zshrc ~/back.zshrc && vim ~/.zshrc && . ~/.zshrc && echo "reloaded ~/.zshrc"'

# コマンド履歴のメモリ上のサイズ
HISTSIZE=10000
# ファイルに保存する履歴のサイズ
SAVEHIST=10000
# 履歴を保存するファイルのパス
HISTFILE=~/.zsh_history

# 同じコマンドの重複を避ける
setopt HIST_IGNORE_ALL_DUPS
# コマンド実行時刻を記録
setopt EXTENDED_HISTORY
#　ビープ音off
setopt no_beep

# ENVIRONMENT
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# terminal 
PROMPT='%K{0}%* [%F{5}%n%f] %F{2}%~%f %#%k '
