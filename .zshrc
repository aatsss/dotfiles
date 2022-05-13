#                                     _              
#                             _______| |__  _ __ ___ 
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__ 
#                          (_)___|___/_| |_|_|  \___|
#
##########################################
# typeset -U path PATH
# # PATH
# PATH=/usr/local/bin:/Library/TeX/texbin:$HOME/bin:$HOME/tools:$PATH
# export PATH

# PATH="$HOME/.rbenv/bin:$PATH"
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi



### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# setup Prezto via zinit
zinit snippet PZT::modules/helper/init.zsh

# setup oh-my-zsh via zinit
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

## ターミナル間でのコマンド履歴を共有しない
## iTermで複数開く際に別windowのコマンドが履歴に追加されるのを防ぐ
setopt no_share_history
unsetopt share_history

## コマンドのシンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# anyframeのセットアップ
zinit light mollifier/anyframe

## zsh settings
# ヒストリファイルを指定
HISTFILE=~/.zsh_history
# ヒストリに保存するコマンド数
HISTSIZE=10000
# ヒストリファイルに保存するコマンド数
SAVEHIST=10000
# 重複するコマンド行は古い方を削除
setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt append_history
# 履歴をインクリメンタルに追加
setopt inc_append_history

# set theme via `starship`
if type "starship" > /dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# add exports
source "$HOME/.zsh.exports"

# add aliases
source "$HOME/.zsh.aliases"