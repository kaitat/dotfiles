"" ----------------------------------------
""	Plugin
"" ----------------------------------------
let s:vimdir   = has('nvim') ? '~/.config/nvim/' : '~/.vim/'
let s:plugdir  = s:vimdir . 'plugged'
let s:plugfile = s:vimdir . 'autoload/plug.vim'
let s:plugurl  = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(s:plugfile))
	silent !echo '[Downloading vim-plug] ...'
	silent execute '!mkdir -p ' . s:vimdir . 'autoload'
	if executable('curl')
		silent execute '!curl -sLo ' . s:plugfile ' ' . s:plugurl
	elseif executable('wget')
		silent execute '!wget -q -O ' . s:plugfile ' ' . s:plugurl
	else
		silent !echo 'vim-plug failed: you need either wget or curl'
		cquit
	endif
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:plugdir)
	" タグ生成
	Plug 'mattn/emmet-vim'
	" カラーテーマ
	Plug 'ayu-theme/ayu-vim'
	" yankバグ修正
	" Plug 'bfredl/nvim-miniyank'
	" コメント
	" Plug 'tpope/vim-commentary'
	" テキスト整形
	" Plug 'junegunn/vim-easy-align'
	" モーションなめらか化
	Plug 'yuttie/comfortable-motion.vim'
	" スペース可視化
	Plug 'bronson/vim-trailing-whitespace'
	" paste モード変更
	" Plug 'ConradIrwin/vim-bracketed-paste'
	" シンタックス/ colorを可視化
	Plug 'sheerun/vim-polyglot' | Plug 'ap/vim-css-color'
	" カッコの自動補完/カッコつけたりする
	Plug 'cohama/lexima.vim' | Plug 'machakann/vim-sandwich'
	"gitをvim上で/ conflict解消
	Plug 'tpope/vim-fugitive' | Plug 'rhysd/conflict-marker.vim'
	" 最強補完と補完と情報表示
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	" find vim
	" Plug 'haya14busa/incsearch.vim' | Plug 'haya14busa/incsearch-fuzzy.vim'
	" 移動(検索に近い)
	" Plug 'Lokaltog/vim-easymotion' | Plug 'haya14busa/incsearch-easymotion.vim'
	" fzf
	Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
call plug#end()
"" ----------------------------------------
""	KeyMapping
"" ----------------------------------------
""-------------------------------------------------------------------------------
"" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------

let mapleader="\<Space>"

"" normal モード
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+
nnoremap tig :tabnew<CR>:term<CR>i tig<CR>
" 行番号の相対表示:絶対表示の切り替え
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
" 保存
nnoremap <Space>w :w<CR>
nnoremap <Space>qqq :q!<CR>
nnoremap <Space>eee :e<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <Space>nn :noh<CR>
" split
nnoremap <Space>s :<C-u>new<CR>
nnoremap <Space>v :<C-u>vnew<CR>
" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <Space>t :tabnew<CR>
"" バッファ操作
nnoremap [j :bprev<CR>
nnoremap [k :bnext<CR>
nnoremap [bbb :bd!<CR>
" 移動を直感的に
nnoremap j gj
nnoremap k gk
" Sft + y => yunk to EOL
nnoremap Y y$
" move 15 words
nmap <S-l> 15<Right>
nmap <S-h> 15<Left>
" ターミナル
nn <Leader>term :split<CR>:terminal<CR>


"" insertモード

"" タブ操作
" tn 新規タブ
map <silent> [Tag]n :tabnew<CR>
" tl 次のタブ
map <silent> [Tag]l :tabnext<CR>
" th 前のタブ
map <silent> [Tag]h :tabprevious<CR>

"" terminalモード
" <ESC>: terminalモードからコマンドモードに変更
tnoremap <silent> <ESC> <C-\><C-n>

" 無効化
nnoremap <C-j> j

"" ----------------------------------------
""	Option
"" ----------------------------------------
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
"set noshowmode

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
set fileencoding=utf-8 fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis
set fileformats=unix,dos,mac

" undofile
set undofile

" タブライン表示
set showtabline=2

"bomb作らない
set nobomb

"キーをspaceに
"let mapleader="\<Space>"

"ステータス常時見せる
set laststatus=2
set statusline=%F         " ファイル名表示
set statusline+=%m        " 変更のチェック表示
set statusline+=%r        " 読み込み専用かどうか表示 
set statusline+=%h        " ヘルプページなら[HELP]と表示
set statusline+=%w\       " プレビューウインドウなら[Prevew]と表示 
set rulerformat=%40(%1*%=%l,%-(%c%V%)\ %=%t%)%*

" ピープ音停止
set noerrorbells visualbell t_vb=

"" ----------------------------------------
""	Color
"" ----------------------------------------
"配色設定
let ayucolor='dark' | colo ayu
set termguicolors
syntax on
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

"" ========== Theme ==========
hi User1 guifg=#3D424D
hi Normal guibg=#0A0E14
hi ModeMsg guifg=#3D424D
hi FoldColumn guibg=#0A0E14
hi EndOfBuffer ctermfg=0 guifg=bg
hi DiffAdd gui=NONE guifg=NONE guibg=#012800
hi DiffText gui=NONE guifg=NONE guibg=#012800
hi DiffChange gui=NONE guifg=NONE guibg=#012800
hi DiffDelete gui=bold guifg=#340001 guibg=#340001


"配色・ハイライト設定
highlight Comment ctermfg=239
highlight Number ctermfg=09
highlight LineNr ctermfg=07
highlight Directory ctermfg=118
highlight RubyInstanceVariable ctermfg=208
highlight htmlTag ctermfg=15
highlight htmlEndTag ctermfg=15
highlight Search term=reverse ctermfg=black ctermbg=248
"補完の配色
highlight Pmenu ctermbg=239
highlight PmenuSel ctermbg=6
highlight PMenuSbar ctermbg=239

" gitgutterの色
set updatetime=250
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGuterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

"シンタックスハイライト(syntax onより前に書かない)
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip

let g:indent_guides_enable_on_vim_startup = 1
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333333 ctermbg=235
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2c2c2c ctermbg=240

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
  augroup ZenkakuSpace
  autocmd!
  autocmd ColorScheme       * call ZenkakuSpace()
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


"" ----------------------------------------
""	PluginSetting
"" ----------------------------------------
"" ========== Fzf ==========
" nn <Leader>file :Files<CR>
" nn <Leader>hist :History<CR>
" nn <Leader>rg :call Rg()<CR>
" let g:fzf_layout={'right': '~50%'}
" com! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview('down:50%'))
" com! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:50%'), <bang>0)
" fun! Rg()
" 	let string=input('Search String: ')
" 	call fzf#run(fzf#wrap({
" 		\ 'source': 'rg -lin ' . string,
" 		\ 'options': '--preview-window bottom:50% --preview "rg -in --color=always ' . string . ' {}"'
" 	\ }))
" endfun
"
"
" ±Á©çlÌÝèãÍRg
let g:fzf_buffers_jump = 1
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)
nnoremap <Space>f :Files<CR>
nnoremap <Space>hist :History<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>l :BLines<CR>
nnoremap <Space>gf :GFiles<CR>
nnoremap <Space>gs :GFiles?<CR>
nnoremap <Space>gl :BCommits<CR>
nnoremap <Space>gla :Commits<CR>
command! -bang -nargs=? -complete=dir GFiles
\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap <C-i> :GFiles<CR>
nnoremap <C-s> :GFiles?<CR>
command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>,
\                 <bang>0 ? fzf#vim#with_preview('up:60%')
\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
\                 <bang>0)
nnoremap <C-g> :Ag<Space>


"" ========== Emmet ==========
let g:user_emmet_settings = {
	\ 'typescript' : { 'extends' : 'jsx' },
	\ 'javascript.jsx' : { 'extends' : 'jsx' }
\ }

"" ========== VimPlug ==========
nn <Leader>clean :PlugClean<CR>
nn <Leader>install :PlugInstall<CR>
nn <Leader>update :PlugUpgrade \| PlugUpdate<CR>

"" ========== Coc.nvim ==========
let g:coc_config_home = "~/.config/coc"
let g:coc_global_extensions = [
      \ 'coc-go',
      \ 'coc-sh',
      \ 'coc-css',
      \ 'coc-sql',
      \ 'coc-rls',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-perl',
      \ 'coc-eslint',
      \ 'coc-vimlsp',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-markdownlint',
\ ]
" nn <Leader>cls :CocList<CR>
" nn <Leader>cupd :CocUpdate<CR>
" nn <Leader>cdis :CocDisable<CR>
" hi CocInfoLine guifg=None guibg=#012800
" hi CocHintLine guifg=None guibg=#012800
" hi CocErrorLine guifg=None guibg=#340001
" hi CocWarningLine guifg=None guibg=#525200
" nm <silent> <Leader>cr <Plug>(coc-reference)
" nm <silent> <Leader>cn <Plug>(coc-diagnostic-next)
" nm <silent> <Leader>cp <Plug>(coc-diagnostic-prev)
" nm <silent> <Leader>ch :call CocAction('doHover')<CR>
" nm <silent> <Leader>cds :call CocAction('jumpDefinition','split')<CR>
" nm <silent> <Leader>cdv :call CocAction('jumpDefinition','vsplit')<CR>

"" ========== Completion ==========
ino <expr> <UP> pumvisible() ? '<C-e><UP>' : '<UP>'
ino <expr> <DOWN> pumvisible() ? '<C-e><DOWN>' : '<DOWN>'
fun! TabComp()
	if pumvisible()
		return "\<C-n>"
	elseif coc#jumpable()
		return "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>"
	else
		return "\<Tab>"
	endif
endfun
im <expr> <Tab> TabComp() | smap <expr> <Tab> TabComp()
fun! TabShiftComp()
	if pumvisible()
		return "\<C-p>"
	elseif coc#jumpable()
		return "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>"
	else
		return "\<S-Tab>"
	endif
endfun
im <expr> <S-Tab> TabShiftComp() | smap <expr> <S-Tab> TabShiftComp()

"" ========== Polyglot ==========
let g:polyglot_excludes = ['csv']

"" ========== EasyAlign ==========
" xm ga <Plug>(LiveEasyAlign)
" nm ga <Plug>(LiveEasyAlign)

"" ========== EasyMotion ==========
let g:EasyMotion_do_mapping=0
let g:EasyMotion_enter_jump_first=1
map <Leader>s <Plug>(easymotion-sn)
fun! s:config_easyfuzzymotion(...) abort
	return extend(copy({
		\ 'converters': [incsearch#config#fuzzyword#converter()],
		\ 'modules': [incsearch#config#easymotion#module({'overwin': 1})],
		\ 'keymap': {"\<CR>": '<Over>(easymotion)'},
		\ 'is_expr': 0,
		\ 'is_stay': 1
	\ }), get(a:, 1, {}))
endfun
no <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

"" ========== VimFugitive ==========
set diffopt+=vertical
nn <Leader>gd :Gdiff<CR>
nn <Leader>ga :Gwrite<CR>
nn <Leader>gb :Gblame<CR>
nn <Leader>gs :Gstatus<CR>
nn <Leader>du :diffupdate<CR>
nn <Leader>gm :Gdiffsplit!<CR>
nn <Leader>dp :diffput 1 \| diffupdate<CR>
nn <Leader>dgl :diffget //2 \| diffupdate<CR>
nn <Leader>dgr :diffget //3 \| diffupdate<CR>

"" ========== NvimMiniyank ==========
" if has("nvim")
" 	map p <Plug>(miniyank-autoput)
" 	map P <Plug>(miniyank-autoPut)
" endif

"" ========== ConflictMarker ==========
hi ConflictMarkerEnd guibg=#2f628e
hi ConflictMarkerOurs guibg=#2e5049
hi ConflictMarkerBegin guibg=#2f7366
hi ConflictMarkerTheirs guibg=#344f69
hi ConflictMarkerCommonAncestorsHunk guibg=#754a81
let g:conflict_marker_end = '^>>>>>>> .*$'
let g:conflict_marker_begin = '^<<<<<<< .*$'

"" ========== VimTrailingSpace ==========
nn <Leader>trim :FixWhitespace<CR>

