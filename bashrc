source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[00m\]$(__git_ps1)\[\033[00m\]\n\$ '


#**************************************************:
# alias ++++++++++++++++++++++
#**************************************************:
# bundle
#**************************************************:

alias bi='bundle install --path vendor/bundle --jobs=4'
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
alias dstartsales='docker-compose start sales'
#停止
alias dstopsales='docker-compose stop sales'
#binding.pry
alias das='docker attach sales'
#rake task
alias rtsales='docker exec -it sales bundle exec rake routes'




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



#**************************************************:
# 忘れやすいもの
#**************************************************:

# jsonサーバ立ち上げ
alias jsons='json-server --watch -p 3001' #xxxxx
# bashファイルの読み込み
alias sbp='source ~/.bash_profile'
# git系コマンドの一覧表示
alias gital='alias | grep git'
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
alias cdguru='cd ~/rails-practice/myapp/gurunabi_kai/gurunabi'
alias cdsales='cd ~/baseconnect/projects/sales/sales'
alias cdbc='cd ~/baseconnect/projects/Baseconnect/Baseconnect'
#短縮
alias rs='rails s'
# vimrc
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
# teypescript on react
alias npmts='npx create-react-app --typescript'
alias yadt='yarn add --dev typescript'
alias yrti='yarn run tsc --init'




# ++++++++++++++++++++++++++++++++++


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
