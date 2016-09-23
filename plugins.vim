scriptencoding utf-8

let s:Psep = ':'
let s:Fsep = '/'

"auto install dein
if filereadable(expand(g:settings.plugin_bundle_dir) . join(['repos', 'github.com', 'Shougo', 'dein.vim', 'README.md'], s:Fsep))
    let g:settings.dein_installed = 1
else
    if executable('git')
        exec '!git clone https://github.com/Shougo/dein.vim '
                    \ . g:settings.plugin_bundle_dir
                    \ . join(['repos', 'github.com', 'Shougo', 'dein.vim'], s:Fsep)
        let g:settings.dein_installed = 1
    else
        echohl WarningMsg | echom "You need install git!" | echohl None
    endif
endif
exec 'set runtimepath+='.g:settings.plugin_bundle_dir . join(['repos', 'github.com', 'Shougo', 'dein.vim'], s:Fsep)

fu! s:begin(path)
    let g:unite_source_menu_menus.AddedPlugins = {'description': 'All the Added plugins                    <leader>lp'}
    let g:unite_source_menu_menus.AddedPlugins.command_candidates = []
    nnoremap <silent><Leader>lp :Unite -silent -winheight=17 -start-insert menu:AddedPlugins<CR>

    call dein#begin(a:path)
endf

fu! s:end()
  call dein#end()
  if g:settings.checkinstall == 1
      if dein#check_install()
          call dein#install()
      endif
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
  exec 'call add(g:unite_source_menu_menus.AddedPlugins.command_candidates, ["['
              \ . a:repo . (len(a:000) > 0 ? (']' . repeat(' ', 40 - len(a:repo)) . '[lazy loaded]  [' . string(a:000[0])) : '')
              \ . ']","OpenBrowser https://github.com/'
              \ . a:repo
              \ . '"])'
endf

fu! s:tap(plugin)
  return dein#tap(a:plugin)
endf

fu! s:defind_hooks(bundle)
  call dein#config(g:dein#name, {
              \ 'hook_source' : "call zvim#util#source_rc('plug_conf/" . split(g:dein#name,'\.')[0] . ".vim')"
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
        if s:tap('unite.vim')
          call s:defind_hooks('unite.vim')
        endif
  call s:add('vim-airline/vim-airline',                { 'merged' : 0})
  call s:add('vim-airline/vim-airline-themes',         { 'merged' : 0})
  if s:tap('vim-airline')
      call s:defind_hooks('vim-airline')
  endif

  " web
  call s:add('othree/html5.vim',                       { 'on_ft':['html']})
  call s:add('groenewege/vim-less',                    { 'on_ft':['less']})
  call s:add('cakebaker/scss-syntax.vim',              { 'on_ft':['scss','sass']})
  call s:add('hail2u/vim-css3-syntax',                 { 'on_ft':['css','scss','sass']})
  call s:add('ap/vim-css-color',                       { 'on_ft':['css','scss','sass','less','styl']})
  call s:add('wavded/vim-stylus',                      { 'on_ft':['styl']})
  call s:add('Valloric/MatchTagAlways',                { 'on_ft':['html' , 'xhtml' , 'xml' , 'jinja']})
  call s:add('pangloss/vim-javascript',                { 'on_ft':['javascript']})
  call s:add('leafgarland/typescript-vim',             { 'on_ft':['typescript']})
  call s:add('kchmck/vim-coffee-script',               { 'on_ft':['coffee']})
  call s:add('elzr/vim-json',                           { 'on_ft':['javascript','json']})
  call s:add('othree/javascript-libraries-syntax.vim', { 'on_ft':['javascript','coffee','ls','typescript']})
  call s:add('Shougo/deoplete.nvim', {'on_i': 1})
  if s:tap('deoplete.nvim')
      call s:defind_hooks('deoplete.nvim')
  endif

"  call s:add('carlitux/deoplete-ternjs',                { 'on_ft':['javascript', 'coffee', 'typescript']})
  call s:add('ternjs/tern_for_vim', { 'on_ft':['javascript', 'coffee', 'typescript']})
  " Use tern_for_vim.
"    let g:tern#command = ["tern"]
"    let g:tern#arguments = ["--persistent"]
    " Use deoplete.
"    let g:tern_request_timeout = 1
"    let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
"    autocmd FileType javascript setlocal omnifunc=tern#Complete

  call s:add('Shougo/neco-syntax',           { 'on_i' : 1})
  call s:add('ujihisa/neco-look',            { 'on_i' : 1})
  call s:add('Shougo/neco-vim',              { 'on_i' : 1})
  if !exists('g:necovim#complete_functions')
    let g:necovim#complete_functions = {}
  endif
    let g:necovim#complete_functions.Ref =
              \ 'ref#complete'
  call s:add('Shougo/context_filetype.vim',  { 'on_i' : 1})
  call s:add('Shougo/neoinclude.vim',        { 'on_i' : 1})
 " call s:add('Shougo/neosnippet-snippets',   { 'on_i' : 1 , 'on_ft' : 'neosnippet'})
"  call s:add('Shougo/neosnippet.vim',        { 'on_i' : 1 , 'on_ft' : 'neosnippet'})
"  call s:add('Shougo/neopairs.vim',          { 'on_i' : 1})
"    let g:neosnippet#snippets_directory = fnamemodify(g:Config_Main_Home, ( has('nvim') ? ':p:h:h:h:h' : ':p:h:h:h')) . s:Fsep . 'snippets'
"    let g:neosnippet#enable_snipmate_compatibility=1
"    let g:neosnippet#enable_complete_done = 1
"    let g:neosnippet#completed_pairs= {}
"    let g:neosnippet#completed_pairs.java = {'(' : ')'}
"    if g:neosnippet#enable_complete_done
"        let g:neopairs#enable = 0
"    endif

  call s:add('tpope/vim-fugitive')
  call s:add('cohama/agit.vim',                        { 'on_cmd':['Agit','AgitFile']})
  call s:add('gregsexton/gitv',                        { 'on_cmd':['Gitv']})

  call s:add('tpope/vim-surround')

  call s:add('neomake/neomake',{'on_cmd' : 'Neomake'})
  if s:tap('neomake')
      call s:defind_hooks('neomake')
      augroup Neomake_wsd
          au!
          autocmd! BufWritePost * Neomake
      augroup END
  endif

  call s:add('scrooloose/nerdcommenter')
  call s:add('easymotion/vim-easymotion',{'on_map' : '<Plug>(easymotion-prefix)'})
  if s:tap('vim-easymotion')
      map <Leader><Leader> <Plug>(easymotion-prefix)
  endif

  call s:add('Yggdroot/indentLine')
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '¦'
    let g:indentLine_concealcursor = 'niv' " (default 'inc')
    let g:indentLine_conceallevel = 2  " (default 2)

  call s:add('godlygeek/tabular',         { 'on_cmd': 'Tabularize'})

  call s:add('scrooloose/nerdtree',{'on_cmd':'NERDTreeToggle'})
    if s:tap('nerdtree')
        call s:defind_hooks('nerdtree')
        function! OpenOrCloseNERDTree()
            exec "normal! A"
        endfunction
        noremap <silent> <F9> :NERDTreeToggle<CR>
        let g:NERDTreeWinPos='right'
        let g:NERDTreeWinSize=31
        let g:NERDTreeChDirMode=1
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        autocmd FileType nerdtree nnoremap <silent><buffer><Space> :call OpenOrCloseNERDTree()<cr>
    endif

  call s:add('majutsushi/tagbar')
    let g:tagbar_width=30
    let g:tagbar_left = 1
    noremap <silent> <F2> :TagbarToggle<CR>

    call s:add('plasticboy/vim-markdown',       { 'on_ft' : 'markdown'})
      let g:vim_markdown_conceal = 0
      let g:vim_markdown_folding_disabled = 1

    call s:add('simnalamburt/vim-mundo',        { 'on_cmd' : 'MundoToggle'})
      nnoremap <silent> <F7> :MundoToggle<CR>

  call s:add('tyru/open-browser.vim',         {
          \'on_cmd' : ['OpenBrowserSmartSearch','OpenBrowser','OpenBrowserSearch'],
          \'on_map' : '<Plug>(openbrowser-',
          \})
    if s:tap('open-browser.vim')
        call s:defind_hooks('open-browser.vim')
    endif
  call s:add('mxw/vim-jsx')
    let g:jsx_ext_required = 0

  call s:add('ryanoasis/vim-devicons')





call s:end()
