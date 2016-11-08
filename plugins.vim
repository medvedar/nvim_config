"fu! s:plugin_list_append()
"endf
"let g:plugin_list = []
"s:plugin_list_append('')


fu! s:begin(path)
	call dein#begin(a:path)
endf

fu! s:end()
	call dein#end()
	if dein#check_install()
   call dein#install()
	endif
  call dein#call_hook('source')
  "call dein#recache_runtimepath()
endf

fu! s:parser(args)
    return a:args
endf

fu! s:add(repo,...)
  if len(a:000) > 0
      call dein#add(a:repo,s:parser(a:000[0]))
  else
      call dein#add(a:repo)
  endif
endf

fu! s:tap(plugin)
  return dein#tap(a:plugin)
endf
fu! s:defind_hooks(bundle)
  call dein#config(g:dein#name, {
              \ 'hook_source' : "call zvim#util#source_rc('conf/" . split(g:dein#name,'\.')[0] . ".vim')"
              \ })
endf

fu! s:fetch()
	call dein#add('Shougo/dein.vim')
endf

call s:begin(g:settings.plugin_bundle_dir)
call s:fetch()

	call s:add('Shougo/vimproc.vim', {'build': 'make'})
  call s:add('Shougo/unite.vim')
  call s:add('Shougo/vimfiler.vim')
    let g:vimfiler_as_default_explorer = 1
  call s:add('neomake/neomake', { 'on_cmd': 'Neomake' })
    autocmd! BufWritePost * Neomake

  call s:add('euclio/vim-markdown-composer', {
        \ 'build': 'cargo build --release',
        \ 'on_ft': 'markdown'})
  call s:add('plasticboy/vim-markdown', {'on_ft': 'markdown'})

	call s:add('jonathanfilip/vim-lucius')

  call s:add('Shougo/deoplete.nvim')
    if s:tap('deoplete.nvim')
      call s:defind_hooks('deoplete.nvim')
    endif
  call s:add('zchee/deoplete-jedi', { 'on_ft': 'python' })

  call s:add('mhinz/vim-startify')
    if s:tap('vim-startify')
      call s:defind_hooks('vim-startify')
    endif

  call s:add('Lokaltog/vim-easymotion')
  call s:add('Raimondi/delimitMate')
    let delimitMate_expand_cr = 2
    let delimitMate_expand_space = 1 " {|} => { | }

  call s:add('vim-airline/vim-airline', { 'if' : 1 })
    if s:tap('vim-airline')
      call s:defind_hooks('vim-airline')
    endif
  call s:add('vim-airline/vim-airline-themes', { 'if' : 1 })

  call s:add('scrooloose/nerdcommenter')
  call s:add('tpope/vim-fugitive')
  call s:add('edkolev/tmuxline.vim')

  call s:add('SirVer/ultisnips')
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  call s:add('honza/vim-snippets')

call s:end()

filetype plugin indent on
syntax enable
