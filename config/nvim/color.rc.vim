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
