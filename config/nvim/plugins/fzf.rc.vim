  let g:fzf_buffers_jump = 1
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)
  nnoremap <Space>f :Files<CR>
  nnoremap <Space>f :FZF<CR>
  nnoremap <Space>b :Buffers<CR>
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

