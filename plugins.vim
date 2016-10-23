fu! s:begin(path)
	call dein#begin(a:path)
endf

fu! s:end()
	call dein#end()
	if dein#check_install()
	  call dein#install()
	endif
  call dein#call_hook('source')
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
	call s:add('jonathanfilip/vim-lucius')
  call s:add('Shougo/unite.vim')
  call s:add('Shougo/deoplete.nvim')
    if s:tap('deoplete.nvim')
      call s:defind_hooks('deoplete.nvim')
    endif
  call s:add('mhinz/vim-startify')
    if s:tap('vim-startify')
      call s:defind_hooks('vim-startify')
    endif
  call s:add('Lokaltog/vim-easymotion')

call s:end()

filetype plugin indent on
syntax enable

