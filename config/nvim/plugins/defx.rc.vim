nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>
autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    " Define mappings
    " 【o】 ファイルを開く
    nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
    " 【s】 ウィンドウを水平分割してファイルを開く
    nnoremap <silent><buffer><expr> s defx#do_action('open', 'split')
    " 【v】 ウィンドウを垂直分割してファイルを開く
    nnoremap <silent><buffer><expr> v defx#do_action('open', 'vsplit')
    " 【c】 ファイルをコピーする
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    " 【m】 ファイルを移動する
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    " 【p】 ファイルを貼り付ける
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    " 【n】 新しいファイルを作成する
    nnoremap <silent><buffer><expr> n defx#do_action('new_file')
    " 【N】 新しいディレクトリを作成する
    nnoremap <silent><buffer><expr> N defx#do_action('new_directory')
    " 【d】 ファイルを削除する
    nnoremap <silent><buffer><expr> d defx#do_action('remove')
    " 【r】 ファイル名を変更する
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    " 【t】 ツリーを表示/非表示する
    nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
    " 【x】 ファイルを実行する
    nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
    " 【yy】 ファイル/ディレクトリのパスをコピーする
    nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
    " 【.】 隠しファイルを表示/非表示する
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    " 【..】 親ディレクトリに移動する
    nnoremap <silent><buffer><expr> .. defx#do_action('cd', ['..'])
    " 【~】 ホームディレクトリに移動する
    nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
    " [esc of q] 消す
    nnoremap <silent><buffer><expr> <Esc> defx#do_action('quit')
    " 【ESC】 / 【q】 defx.nvimを終了する
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    " 【j】 カーソルを下に移動する
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    " 【k】 カーソルを上に移動する
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    " 【cd】 Neovim上のカレントディレクトリを変更する
    nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
  endfunction
