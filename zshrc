# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

#グロブ展開させない
setopt nonomatch

# 日本語を使用
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export XDG_CONFIG_HOME=/Users/miyazakikaito/.config
export XDG_CACHE_HOME=/Users/miyazakikaito/.cache

# 色を使用
autoload -Uz colors
colors

#emac風
bindkey -d
bindkey -e

# 補完
autoload -Uz compinit
compinit

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct
# backspace,deleteキーを使えるように
stty erase ^H
bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char

# どこからでも参照できるディレクトリパス
cdpath=(~)

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./;@"
zstyle ':zle:*' word-style unspecified

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# プロンプトを2行で表示、時刻を表示
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~
🙆"

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# 複数ファイルのmv 例　zmv *.txt *.txt.bk
autoload -Uz zmv
alias zmv='noglob zmv -W'

# git設定
RPROMPT="%{${fg[brue]}%}%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#**************************************************:
# alias ++++++++++++++++++++++
#**************************************************:
# bundle
#**************************************************:

alias -g bi='bundle install --path vendor/bundle --jobs=4'
alias vb='echo "/vendor/bundle" >> .gitignore'

#**************************************************:
# mysql
#**************************************************:

# 読み込み(rails)
alias bcmysql='bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"'

#**************************************************:
# git
#**************************************************:

#チェックアウトする
function grename() {
  git branch;
  read -p "change branch >>" branchname;
  git checkout ${branchname};
}

#featureなんちゃらにチェックアウト
function fcob() {
  git branch;
  read -p "feature/miyazaki/xxxxxxxx >>  xxxxxを入力してください" branchname;
  git checkout -b feature/miyazaki/${branchname};
}

#remote へ push
function frp() {
  git branch;
  read -p "feature/miyazaki/xxxxxxxxxx >> xxxxxxxを入力してください" branchname
  git push -u origin feature/miyazaki/${branchname};
}

function cmt() {
  git add .;
  read -p "commit message >>" commitmessage;
  git commit -m "${commitmessage}";
}

function first() {
  git checkout develop;
  git pull;
  git branch;
  read -p "feature/miyazaki/xxxxxxxx >>  branch名を入力してください" branchname;
  git checkout -b feature/miyazaki/${branchname};
  blankco;
  git push -u origin feature/miyazaki/${branchname};

}



alias pull='git pull'
alias push='git push'
alias st='git status'
alias stt='git status -uno'
alias ad='git add .'
alias cob='git checkout -b'
alias gris='git reflog --date=local -n 10'
# ツリー表示
alias gr='git gr'
# ステータス変更のあったファイルのみ変更
alias gdif='git diff --name-only'
#remoteのブランチの情報を取得
alias gfod='git fetch origin develop'
#origin develop のマージ
alias gmod='git merge origin/develop'
#空コミット
alias blankco='git commit --allow-empty -m "[ci skip] first commit"'
#**************************************************:
# docker
#**************************************************:
#rails c
function dcrc() {
  read -p "baseconnect or sales?  >>" name;
  docker exec -it ${name} bundle exec rails c;
}

#起動中のコンテナ表示
alias dps='docker ps'
#全コンテナ表示
alias dpsa='docker ps -a'
#dstart xxxx でxxxxを起動
alias dstart='docker start'
#dstop xxxx でxxxxを停止
alias dstop='docker stop'
#省略
alias dc='docker-compose'



#*********************
#sales
#*********************
#起動
alias dstartsales='docker-compose start sales redis && docker attach sales'
#停止
alias dstopsales='docker-compose stop sales redis'
#binding.pry
alias das='docker attach sales'
#rake task
alias rtsales='docker exec -it sales bundle exec rake routes'
#yarn start
alias salesyarn='yarn run start:sales:dev'
# adminサイトの起動
alias adminstart='cd admin && yarn run dev:serve'
# rails c
alias dcsalesrc='docker exec -it sales bundle exec rails c'
# robocop
alias rubosales='docker exec sales bundle exec rubocup'





#*********************
#Baseconnect
#*********************
#起動
alias dstartbc='docker-compose start baseconnect && docker attach baseconnect'
#停止
alias dstopbc='docker-compose stop baseconnect'
#rake task
alias rtbc='docker exec -it baseconnect bundle exec rake routes'
#binding.pry
alias dab='docker attach baseconnect'
#;yarn build
alias bcyarn='yarn run build:devlocal'
#redis起動
alias dcredis='dc up redis'
#rails c
alias dcbcrc='docker exec -it baseconnect bundle exec rails c'



#**************************************************:
# 忘れやすいもの
#**************************************************:

# jsonサーバ立ち上げ
alias jsons='json-server --watch -p 3001' #xxxxx
# bashファイルの読み込み
alias sbp='source ~/.bash_profile'
alias szsh='source ~/.zshrc'
# git系コマンドの一覧表示
alias algit='alias | grep git'
#grep
alias alg='alias | grep'
# 直下ファイル全検索
alias figr='find . -type f | grep'
# 直下ディレクトリ全てのファイル内の文章検索
alias stgr='find . -type f | xargs grep'
#lsの進化版
alias ll='ls -alFG'
#ディレクトリに移動
alias cdrails='cd ~/rails-practice'
alias cdreact='cd ~/JS-practice'
alias cdguru='cd ~/rails-practice/myapp/guru'
alias cdsales='cd ~/baseconnect/projects/sales/sales'
alias cdbc='cd ~/baseconnect/projects/Baseconnect/Baseconnect'
#短縮
alias rs='rails s'
# teypescript on react
alias npmts='npx create-react-app --typescript'
alias yadt='yarn add --dev typescript'
alias yrti='yarn run tsc --init'

# グローバルエイリアス
alias -g G='| grep'
alias -g GI='| grep -ri'

# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias back='pushd'
alias diff='diff -U1'





# ++++++++++++++++++++++++++++++++++


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}
