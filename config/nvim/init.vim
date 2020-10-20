" ============== dein =================
" Pythonインタプリタへのパスを指定
" Ubuntuでも使い回す予定なので分けています
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python3')
let g:python_host_prog = expand('~/.pyenv/shims/python')
let g:ruby_host_prog = expand('/Users/miyazakikaito/.anyenv/envs/rbenv/versions/2.6.5/bin/neovim-ruby-host')
" 各種ファイルへのパス
let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'
let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml = s:dein_config_dir . '/dein.toml'
let s:toml_lazy = s:dein_config_dir . '/dein_lazy.toml'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Required:
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)

  " tomlファイルからプラグインのリストをロードしキャッシュする
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

runtime! ./options.rc.vim
runtime! ./keymap.rc.vim
runtime! ./functions.rc.vim
runtime! ./color.rc.vim

