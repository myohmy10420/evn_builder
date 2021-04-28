function! s:rails_test_helpers()
  let type = rails#buffer().type_name()
  let relative = rails#buffer().relative()
  if type =~ '^test' || relative =~ '^test/'
    nmap <Leader>t [rtest]
    nnoremap <silent> [rtest]j :call <SID>rails_test_tmux('v')<CR>
    nnoremap <silent> [rtest]l :call <SID>rails_test_tmux('h')<CR>
    nnoremap <silent> [rtest]f :call <SID>rails_test_tmux('file')<CR>
  end
endfunction

autocmd User Rails call s:rails_test_helpers()

function! s:rails_test_tmux(method)
  let [it, path] = ['', '']

  let rails_type = rails#buffer().type_name()
  let rails_relative = rails#buffer().relative()

  if rails_type =~ '^test'
    let it = matchstr(
          \   getline(
          \     search('^\s*it\s\+\(\)', 'bcnW')
          \   ),
          \   'it\s*[''"]\zs.*\ze[''"]'
          \ )
    let path = rails_relative
  end

  if empty(it) || empty(path)
    let it   = get(s:, 'rails_test_tmux_last_it', '')
    let path = get(s:, 'rails_test_tmux_last_path', '')
  end

  if empty(it) || empty(path)
    echohl WarningMsg | echomsg 'No `it` block found' | echohl None
    return
  end

  let s:rails_test_tmux_last_it = it
  let s:rails_test_tmux_last_path = path
    if a:method == 'file'
      let test_command = printf('bundle exec ruby -Itest %s', path)
    else
      let test_command = printf('bundle exec ruby -Itest %s --name /%s/', path, shellescape(escape(it, '()')))
    end

    let type_short = matchstr(rails_type, '\vtest-\zs.{4}')
    if type_short == 'unit'
      let title = type_short
    elseif type_short == 'func'
      let title = type_short
    else
      let title = type_short
    endif

    call TmuxNewMiniTestWindow({
      \   "text": test_command,
      \   "title": '∫ ' . title,
      \   "remember_pane": 1,
      \   "method": a:method
      \ })
endfunction

function! TmuxNewMiniTestWindow(...)
  let options = a:0 ? a:1 : {}
  let text = get(options, 'text', '')
  let title = get(options, 'title', '')
  let directory = get(options, 'directory', getcwd())
  let method = get(options, 'method', 'new-window')
  let size = get(options, 'size', '40')
  let remember_pane = get(options, 'remember_pane', 0)
  let pane = ''

  if method == 'file'
    let method = 'h'
  end

  if empty(pane)
    if method == 'v'
      let cmd = 'tmux split-window -d -v '
            \ . printf('-p %s -c %s ', size, shellescape(directory))
    elseif method == 'h'
      let cmd = 'tmux split-window -d -h '
            \ . printf(' -c %s ', shellescape(directory))
    endif

    let pane = substitute(
          \   system(cmd . ' -P -F "#{window_id}#{pane_id}"'), '\n$', '', ''
          \ )
  endif

  if remember_pane
    let s:last_tmux_pane = pane
  endif

  let window_id = matchstr(pane, '@\d\+')
  let pane_id = matchstr(pane, '%\d\+')

  if !empty(text)
    let cmd = printf(
          \   'tmux set-buffer %s \; paste-buffer -t %s -d \; send-keys -t %s Enter',
          \   shellescape(text),
          \   pane_id,
          \   pane_id
          \ )
    sleep 300m
    call system('tmux select-window -t ' . window_id)
    call system(cmd)
  endif
endfunction
