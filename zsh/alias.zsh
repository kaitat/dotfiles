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
# docker
#**************************************************:
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
#dc run --rm 短縮
alias dcr='dc run --rm'



# **************************
# docker
# **************************
#rspec
alias dcrs='dcr app bundle exec rspec'
# rubocop
alias dcrubo='dcr app bundle exec rubocop'



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
alias dump='dcr app pg_restore --verbose --clean --no-acl --no-owner -h db -U postgres -d myapp_development latest.dump'

# ssh
alias sshcent7='ssh kaito@192.168.3.21'

# nvim 開かせる
# alias vi='nvim'
# ++++++++++++++++++++++++++++++++++


#**************************************************:
# awk
#**************************************************:
# alias awkspace='awk -v IFS=' ' -v OFS=',' '{$1=$1;print $0}''
