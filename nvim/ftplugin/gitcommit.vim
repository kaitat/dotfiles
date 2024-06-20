function! s:select_type() abort
  let git_branch =  system('git rev-parse --abbrev-ref HEAD')
  let ti = substitute(git_branch, '^miyazaki/', '', 'g')
  let ticket = substitute(ti, '/.\+', '', 'g')
  let line = substitute(getline('.'), '^#\s*', '', 'g')
  let title = printf('%s [' . ticket . '] ' , split(line, ' ')[0])

  silent! normal! "_dip
  silent! put! =title
  silent! normal! A
  silent! startinsert!
endfunction

nnoremap <buffer> <CR>s :call <SID>select_type()<CR>

function! s:kizon_select_type() abort
  let git_branch =  system('git rev-parse --abbrev-ref HEAD')
  let ticket = substitute(git_branch, '\h\+/\h\+/', '', 'g')
  let line = substitute(getline('.'), '^#\s*', '', 'g')
  let title = printf('%s #'. ticket , split(line, ' ')[0])

  silent! normal! "_dip
  silent! put! =title
  silent! normal! A 
  silent! startinsert!
endfunction

nnoremap <buffer> <CR>k :call <SID>kizon_select_type()<CR>

function! s:le_select_type() abort
  let line = substitute(getline('.'), '^#\s*', '', 'g')
  let title = split(line, ' ')[0]

  silent! normal! "_dip
  silent! put! =title
  silent! normal! A 
  silent! startinsert!
endfunction

nnoremap <buffer> <CR>l :call <SID>le_select_type()<CR>
