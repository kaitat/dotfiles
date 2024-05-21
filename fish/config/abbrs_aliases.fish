abbr ll 'ls -hl'
abbr la 'ls -hlA'
abbr lt 'ls --tree'
abbr lg 'ls -hlFg'

abbr -a v nvim
abbr -a nv nvim

abbr -a gcn 'git clean -n'
abbr -a gcf 'git clean -f'
abbr -a gcnd 'git clean -nd'
abbr -a gcd 'git clean -d'
abbr -a gcx 'git clean -dfx'


abbr -a bash 'bash --norc'
abbr -a cdr 'cd (git root)'
abbr -a sed gsed

abbr -a rr 'rm -r'
abbr -a rf 'rm -rf'

abbr -a mkd 'mkdir -p'
abbr -a mkdir 'mkdir -p'

abbr -a cdd __fzf_cd

abbr -a o open
abbr -a vivaldi 'open -a /Applications/Vivaldi.app'

# docker
abbr -a d docker
abbr -a dp "docker ps"
abbr -a db "docker build"
abbr -a dr "docker run --rm"
abbr -a dx "docker exec -it"
abbr -a dc docker compose
abbr -a dcu "docker compose up"
abbr -a dcub "docker compose up --build"
abbr -a dcd "docker compose down"
abbr -a dcr "docker compose restart"

abbr -a de "deno run -A --unstable"

# git configs
abbr -a g git
abbr -a ga 'git add'
abbr -a ga. 'git add .'
abbr -a gaa 'git add --all'
abbr -a gc 'git commit'
abbr -a --set-cursor gcm git commit -m \"%\"
abbr -a gp 'git push'
abbr -a gpo 'git push origin'
abbr -a gpf 'git pushf'
abbr -a gpfo 'git pushf origin'
abbr -a gpl 'git pull'
abbr -a gf 'git fetch'
abbr -a gsw 'git switch'
abbr -a blankco 'git commit --allow-empty -m "blank commit"'

# github copilot
abbr -a --set-cursor q gh copilot suggest -t shell \"%\"
abbr -a --set-cursor qgit gh copilot suggest -t git \"%\"
abbr -a --set-cursor qgh gh copilot suggest -t gh \"%\"


