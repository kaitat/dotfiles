let g:NERDTreeChDirMode=2
let g:NERDTreeQuitOnOpen=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="right"
let g:NERDTreeDirArrowExpandable = '👌'
let g:NERDTreeDirArrowCollapsible = '🍎'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <Space>dir :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" vim だけ打った時のみtreeを表示する
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" :q したときにnerdtreeが出てたら同時に削除
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
