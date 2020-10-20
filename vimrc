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

runtime! config/*.vim
