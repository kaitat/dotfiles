" 編集中でもファイルを開けるように
set hidden

" 他で編集したファイルを自動で再読み込み
set autoread

" スクロール時の余白行数
set scrolloff=5
set sidescrolloff=6

" バックアップを作成しない
set nobackup

" バックスペースでなんでも消せるように
set backspace=indent,eol,start

" テキスト整形オプション
set formatoptions=lmq
autocmd Filetype * setlocal formatoptions-=ro

" ビープ無効
set visualbell t_vb=

" 現在のディレクトリから開始
set browsedir=buffer

" カーソルを行をまたいで移動
"set whichwrap=b,s,h,l,<,>,[,]

" コマンドをステータスに表示
set showcmd

" 現在のモードを非表示
set noshowmode

" viminfoの設定
set viminfo='50,<1000,s100,\"50

" モードラインを無効
set modelines=0

" タイトルを変更させない
set notitle

" ヤンクでクリップボードを使用
" バグがあるのでコメントアウト
" https://github.com/neovim/neovim/isses/1822
set clipboard=unnamed

" コマンドモードで補完を使用
set wildmode=longest:full,full
set wildmenu
set wildignorecase

" スワップファイルを作らない
set noswapfile

" 折り返さない
" set nowrap

" ルーラーを表示
set ruler

" 不可視文字を表示
set list

" 不可視文字の設定
set listchars=tab:▹\ ,trail:-,extends:»,precedes:«,eol:\ ,nbsp:%

" 開始時の挨拶を表示しない
set shortmess+=I

" 検索ループ時のメッセージを表示しない
set shortmess+=s

" カレント行のハイライト
"set cursorline

" 対応する括弧をハイライト表示する
set showmatch

" 括弧のハイライト表示の秒数を設定
set matchtime=3

" 行番号を表示
set number

" 行番号を相対値で表示
" set relativenumber

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

" tabの幅
set tabstop=2

" tabをスペースにする
set expandtab

" スマートインデント
set smartindent

" オートインデント
set autoindent

" キーボードから入力した場合のtabの幅
set softtabstop=2

" 自動で挿入/削除されるインデントの量
set shiftwidth=2

" 折りたたみ
set foldmethod=marker
set foldlevel=1
set foldcolumn=0

" 末尾まで検索後、ファイル先頭にループさせる
" set wrapscan

" 検索で大文字小文字を区別しない
set ignorecase

" 検索文字に大文字があるときは大文字小文字を区別する
set smartcase

" インクリメンタルサーチ
set incsearch

" 検索文字列をハイライト表示
set hlsearch

" ハイライトのカラー
" hi Search ctermbg=brown
" hi Search ctermfg=White
set modifiable
" grep
if has('win32')
  set grepprg=jvgrep
endif

" タグファイルを指定
set tags+=.tags,./.tags

" 補完時に1行まるごと補完
set showfulltag

" タグから補完リストに追加
set wildoptions=tagfile

" 文字コード関係
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis
set fileformats=unix

" undofile
set undofile

" color
set termguicolors
syntax on
let ayucolor="dark"
colorscheme ayu

" タブライン表示
set showtabline=2

