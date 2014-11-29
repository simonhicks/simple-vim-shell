function! s:editop() abort
  if !exists('g:SHELL_HISTORY') || type(g:SHELL_HISTORY) != type([])
    unlet! g:SHELL_HISTORY
    let g:SHELL_HISTORY = []
  endif
  try
    let s:old_hist = s:histswap(g:SHELL_HISTORY)
    let result=s:input("")
    if exists("result") && len(result) > 0
      exe "!".result
    endif
  finally
    if exists('s:old_hist')
      let g:SHELL_HISTORY = s:histswap(s:old_hist)
    endif
  endtry
endfunction

function! s:input(default) abort
  call feedkeys(&cedit . ":set ft\<tab>=sh\<CR>i", 'n')
  return s:actually_input(a:default)
endfunction

function! s:actually_input(...) abort
  return call(function('input'), a:000)
endfunction

function! s:histswap(list) abort
  let old = []
  for i in range(1, histnr('@') * (histnr('@') > 0))
    call extend(old, [histget('@', i)])
  endfor
  call histdel('@')
  for entry in a:list
    call histadd('@', entry)
  endfor
  return old
endfunction

nnoremap <silent> <Plug>OpenShell :<C-U>call <SID>editop()<CR>

nmap <buffer> ! <Plug>OpenShell
