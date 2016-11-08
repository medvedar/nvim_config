let g:deoplete#enable_at_startup = 1
    set completeopt=longest,menuone,preview
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#auto_refresh_delay = 200
    let g:deoplete#max_abbr_width = 25
    let g:deoplete#max_menu_width = 40
    let g:deoplete#auto_complete_delay = 200
    let g:deoplete#omni#functions = {}
    "let g:deoplete#omni#functions['javascript.jsx'] = ['tern#Complete']
    let g:deoplete#sources = {}
    "let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer']
    "let g:deoplete#sources.html = ['file', 'buffer', 'omni']
    let g:deoplete#sources.python = ['file', 'ultisnips', 'jedi']
    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
    endif
    "let g:deoplete#omni#input_patterns['javascript.jsx'] = '[^. \t]\.\%(\h\w*\)\?'
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
