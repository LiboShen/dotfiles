nnoremap <leader>hf :!hg fixwdir<cr>
nnoremap <leader>ha :!hg amend<cr>

let g:term_buf = 0
function! Term_toggle()
  1wincmd w
  if g:term_buf == bufnr("")
    setlocal bufhidden=hide
    close
  else
    topleft vnew
    try
      exec "buffer ".g:term_buf
    catch
      call termopen("watch --color \"hg xl --color=always\"", {"detach": 0})
      let g:term_buf = bufnr("")
    endtry
    startinsert!
  endif
endfunction
nnoremap <f4> :call Term_toggle()<cr>
tnoremap <f4> <C-\><C-n>:call Term_toggle()<cr>

