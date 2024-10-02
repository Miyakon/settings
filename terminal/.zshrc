# TODO
# brew install zsh-completions
#   Caveatsの指示にしたがってchmodとrm実行 
# brew install zsh-git-prompt

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

# ENVIRONMENT
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# git on terminal
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
alias python="python3"

precmd() {
  git_prompt
  add_newline
}

# Terminal
git_prompt() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    PROMPT="%F{034}%h%f:%F{020}%~%f $(git_super_status)"$'\n'"%# "
    PROMPT='%K{0}%* [%F{5}%n%f] %F{2}%~%f $(git_super_status)%#%k '
  else
    PROMPT='%K{0}%* [%F{5}%n%f] %F{2}%~%f %#%k '
  fi
}

add_newline() {
  if [[ -z $PS1_NEWLINE_LOGIN ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}