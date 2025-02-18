function! termsend#send() abort
  " Get the current line
  let l:line = getline('.')

  " Get terminal window numbers and buffer numbers
  let l:term_win_num_list = []
  let l:term_buf_num_list = []
  for l:win_num in range(1, winnr('$'))
    let l:buf_num = winbufnr(l:win_num)
    if getbufvar(l:buf_num, '&buftype') ==# 'terminal'
      call add(l:term_win_num_list, l:win_num)
      call add(l:term_buf_num_list, l:buf_num)
    endif
  endfor

  " Do nothing if multiple terminal windows are found
  if len(l:term_win_num_list) == 0
    echoerr "termsend: No terminal windows found. Do nothing."
    return
  elseif len(l:term_win_num_list) > 1
    echoerr "termsend: Found multiple terminal windows. Do nothing."
    return
  endif
  let l:term_win_num = l:term_win_num_list[0]
  let l:term_buf_num = l:term_buf_num_list[0]

  let l:orig_win_num = winnr()
  let l:orig_win_id = win_getid(l:orig_win_num)
  let l:term_win_id = win_getid(l:term_win_num)
  if has('nvim')
    " Send the line to the terminal
    let l:term_job_id = getbufvar(l:term_buf_num, 'terminal_job_id')
    call chansend(l:term_job_id, l:line)
    call chansend(l:term_job_id, "\n")

    " Move the terminal window to the end
    call win_gotoid(l:term_win_id)
    normal! G
  else
    echoerr "termsend: Not implemented yet."
    return

    "" Send the line to the terminal
    "call win_gotoid(l:term_win_id)
    "sleep 100m

    "call feedkeys("i", 'n')
    "for i in range(len(line))
    "  let l:key = l:line[i]
    "  call feedkeys(l:key, 'n')
    "endfor

    "call feedkeys("\<CR>", 'n')
  endif

  call win_gotoid(l:orig_win_id)
endfunction

command! -nargs=0 TermSend call termsend#send()
