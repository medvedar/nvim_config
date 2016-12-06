" Настраиваем поиск
set ignorecase smartcase
set cursorline

"set foldmethod=syntax
set t_Co=256
"set wildmode=list:longest
set termguicolors
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignorecase
set scrolloff=3
set breakindent
set splitbelow
set splitright
set nobackup
set backupdir-=.
set backupdir^=~/tmp,/tmp
set noswapfile
set linebreak " переносить целые слова

" Show trailing whitespace as red
"highlight ExtraWhitespace ctermbg=darkred guibg=#382424
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Табуляция
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent
set expandtab

" Линейка
set nu
set nuw=4
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

" Англ. по выходе из insert
autocmd InsertLeave * call SetUsLayout()



"===============================================
"===============    Плагины    =================
"===============================================
call plug#begin('~/.config/nvim/plugged')

"------------- Цветовые схемы ------------------
  "Plug 'morhetz/gruvbox'
	Plug 'jonathanfilip/vim-lucius'
  Plug 'vim-airline/vim-airline-themes'

"------------ Стартовый экран ------------------
	Plug 'mhinz/vim-startify'
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/conf/vim-startify.vim'

"--------- Умная строка состояния --------------
	Plug 'bling/vim-airline'
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/conf/vim-airline.vim'
"--------- Визуализация undo tree --------------
	Plug 'mbbill/undotree'
		if has("persistent_undo")
			set undodir=~/.config/nvim/.undodir/
			set undofile
		endif
     
"------- Навигация по коду/проекту -------------
  Plug 'majutsushi/tagbar'
  Plug 'Shougo/unite.vim'
    let g:unite_source_history_yank_enable = 1
  Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep'
  Plug 'Lokaltog/vim-easymotion'
"--------------- Git ----------------------
  Plug 'tpope/vim-fugitive'
  Plug 'cohama/agit.vim', {'on': 'Agit'}
  Plug 'gregsexton/gitv', {'on': 'Gitv'}

  Plug 'Yggdroot/indentLine'
  let g:indentLine_faster = 1
    " TODO:
    "   - mayby configure
    set list
    set listchars=""                      " reset
    set listchars+=trail:●

  Plug 'scrooloose/nerdcommenter'

  Plug 'neomake/neomake'
    " TODO:
    "   - configure
    autocmd! BufWritePost * Neomake
    "let g:neomake_javascript_jshint_maker = {
    "\ 'args': ['--verbose'],
    "\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    "\ }
    "let g:neomake_javascript_enabled_makers = ['jshint']

"-----------=== Поддержка языков ===------------
"----- Python
  Plug 'zchee/deoplete-jedi', {'for': ['python'] }
  Plug 'klen/python-mode', {'for': ['python'] }
    let g:pymode_rope_completion = 0
  Plug 'carlitux/deoplete-ternjs', {'for': ['javascript', 'javascript.jsx']}
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }


"----- Emmet
  Plug 'mattn/emmet-vim', { 'for': ['html','xhtml','css','sass','scss','xml', 'php'] }
    au FileType html,css,php,sass,scss,less imap <expr>jk  emmet#expandAbbrIntelligent("\<tab>")
  Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss' ]}

  Plug 'elzr/vim-json', {'for': ['javascript','javascript.jsx', 'json']}
  Plug 'Valloric/MatchTagAlways'

  Plug 'othree/html5.vim',           { 'for': ['html', 'php'] }
    let g:html5_event_handler_attributes_complete = 0
    let g:html5_rdfa_attributes_complete          = 0
    let g:html5_microdata_attributes_complete     = 0
    let g:html5_aria_attributes_complete          = 0

  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'
       augroup VimCSS3Syntax
        autocmd!
        autocmd FileType css setlocal iskeyword+=-
        autocmd FileType scss setlocal iskeyword+=-
       augroup END

" Plug 'groenewege/vim-less',       { 'for': ['less']   }


  Plug 'pangloss/vim-javascript',      { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/javascript-libraries-syntax.vim',{ 'for': ['javascript', 'javascript.jsx'] }
    let g:used_javascript_libs = 'jquery,react,flux'
  Plug 'mxw/vim-jsx',      { 'for': ['javascript', 'javascript.jsx'] }
    let g:jsx_ext_required = 0

  Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/vimfiler.vim'
    let g:loaded_netrwPlugin = 1
    let g:vimfiler_as_default_explorer = 1

  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  Plug 'honza/vim-snippets'

"--------------=== Автокомплит ===---------
"----- Deoplete
" TODO:
"   - configure autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/conf/deoplete.vim'
"---------------=== Разное ===------------------
  Plug 'chreekat/vim-paren-crosshairs'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'

call plug#end()

"colorscheme NeoSolarized
colorscheme lucius
LuciusLightHighContrast

"set background=light
"colorscheme gruvbox
autocmd VimEnter *  set concealcursor=

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"map       <Space>      <Leader>
nnoremap <silent> <Home> :<C-u>Unite -quick-match buffer file<CR>
map <space> <Plug>(easymotion-prefix)
map <F2> :UndotreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :VimFilerExplorer<CR>
inoremap kj <Esc>
nnoremap <esc> :noh<return><esc>
"<TAB> for switch window
nnoremap <silent> <Tab> :wincmd w<CR>


function! SetUsLayout()
	silent !layoutswitch 0
endfunction
