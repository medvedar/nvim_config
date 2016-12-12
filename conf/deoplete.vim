set completeopt=longest,menuone,preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_refresh_delay = 200
let g:deoplete#max_abbr_width = 25
let g:deoplete#max_menu_width = 40
let g:deoplete#auto_complete_delay = 200
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions['javascript.jsx'] = ['tern#Complete']
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.scss = '\\?[$]\w*'
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer']
let g:deoplete#sources.html = ['file', 'buffer', 'omni']
let g:deoplete#sources['scss'] = ['ultisnips', 'buffer', 'file', 'omni']
let g:deoplete#sources.python = ['file', 'buffer', 'ultisnips', 'jedi']
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns['javascript.jsx'] = '[^. \t]\.\%(\h\w*\)\?'
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:tern_request_timeout = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

 " omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
  "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup en
