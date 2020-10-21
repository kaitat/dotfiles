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
alias sqlstart='mysql.server start'
alias sqlstop='mysql.server stop'
alias sqlstatus='mysql.server status'

#**************************************************:
# git
#**************************************************:
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
alias blankco='git commit --allow-empty -m "first commit"'
#untraced file の削除ファイル確認
alias gcn='git clean -n'
#untraced file の削除認
alias gcf='git clean -f'
#untraced file の削除ディレクトリ確認
alias gcnd='git clean -nd'
#untraced file のディレクトリ削除
alias gcd='git clean -d'
alias cod='git checkout develop'
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
#none-image削除
alias dockerrm='docker images -f 'dangling=true' -q | xargs -n 1 docker rmi'



# **************************
# guru
# **************************
#rspec
alias gurutest='dc run --rm back bundle exec rspec'
#dc run --rm back を短縮
alias dcguru='dc run --rm back'
# rubocop todo に入れる
alias gururubotodo='dcguru bundle exec rubocop --auto-gen-config'
# rubocop
alias gururubo='dcguru bundle exec rubocop'
# test
alias gurutest='dcguru bundle exec rspec'



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
alias cdchoco='~/rails-practice/choco/choco'
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

# nvim 開かせる
# alias vi='nvim'
# ++++++++++++++++++++++++++++++++++

