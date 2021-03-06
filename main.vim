function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

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
  Plug 'morhetz/gruvbox'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'vim-airline/vim-airline-themes'

"------------ Стартовый экран ------------------
	Plug 'mhinz/vim-startify'
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/conf/vim-startify.vim'

"--------- Умная строка состояния --------------
	Plug 'bling/vim-airline'
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/conf/vim-airline.vim'
"--------- Визуализация undo tree --------------
  "Plug 'mbbill/undotree'
  Plug 'simnalamburt/vim-mundo'
    set undofile
    set undodir=~/.config/nvim/.undodir/

"------- Навигация по коду/проекту -------------
  Plug 'majutsushi/tagbar', {'on': ['TagbarToggle', 'Tagbar']}
  Plug 'mtscout6/vim-tagbar-css', {'for': ['css', 'scss']}
  Plug 'Shougo/unite.vim'
    let g:unite_source_history_yank_enable = 1
  "Plug 'Shougo/denite.nvim'
  Plug 'mileszs/ack.vim', {'on': ['Ack']}
    let g:ackprg = 'ag --vimgrep'
  Plug 'Lokaltog/vim-easymotion'
"--------------- Git ----------------------
  Plug 'tpope/vim-fugitive'
  Plug 'cohama/agit.vim', {'on': 'Agit'}
  "Plug 'gregsexton/gitv', {'on': 'Gitv'}

  Plug 'Yggdroot/indentLine', {'for': ['html', 'css', 'scss', 'vim']}
  "let g:indentLine_faster = 1
    " TODO:
    "   - mayby configure
    set list
    set listchars=""                      " reset
    set listchars+=trail:●

  Plug 'scrooloose/nerdcommenter'

  Plug 'neomake/neomake', {'on': ['Neomake']}
    " TODO:
    "   - configure
    autocmd! BufWritePost * Neomake

"-----------=== Поддержка языков ===------------
"----- Lua
  Plug 'tbastos/vim-lua', {'for': ['lua']}

"----- Python
  Plug 'python-mode/python-mode', {'for': ['python'] }
    let g:pymode_python = 'python3'
    let g:pymode_rope_completion = 0

"----- Emmet
  Plug 'mattn/emmet-vim', { 'for': ['html','xhtml','css','sass','scss','xml', 'php'] }
    let g:user_emmet_complete_tag=1
    let g:user_emmet_settings=json_decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
    au FileType html,css,php,sass,scss,less imap <expr>jk  emmet#expandAbbrIntelligent("\<tab>")
  Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss' ]}

  Plug 'elzr/vim-json', {'for': ['javascript','javascript.jsx', 'json']}
  Plug 'Valloric/MatchTagAlways'

  Plug 'othree/html5.vim',           { 'for': ['html', 'php'] }
    let g:html5_event_handler_attributes_complete = 0
    let g:html5_rdfa_attributes_complete          = 0
    let g:html5_microdata_attributes_complete     = 0
    let g:html5_aria_attributes_complete          = 0

  Plug 'hail2u/vim-css3-syntax',  { 'for': ['css', 'scss'] }
  Plug 'cakebaker/scss-syntax.vim',  { 'for': ['css', 'scss'] }
       augroup VimCSS3Syntax
        autocmd!
        autocmd FileType css setlocal iskeyword+=-
        autocmd FileType scss setlocal iskeyword+=-
       augroup END


  Plug 'pangloss/vim-javascript',      { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/javascript-libraries-syntax.vim',{ 'for': ['javascript', 'javascript.jsx'] }
    let g:used_javascript_libs = 'jquery,react,flux'
  Plug 'mxw/vim-jsx',      { 'for': ['javascript', 'javascript.jsx'] }
    let g:jsx_ext_required = 0

  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_conceal = 0
  "Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'), 'for': ['markdown'] }

  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/vimfiler.vim'
    let g:loaded_netrwPlugin = 1
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_ignore_pattern = ['node_modules']

  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  Plug 'honza/vim-snippets'

  Plug 'chrisbra/csv.vim'

"--------------=== Автокомплит ===---------
"----- Deoplete
" TODO:
"   - configure autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi', {'for': ['python'] }
  Plug 'carlitux/deoplete-ternjs', {'for': ['javascript', 'javascript.jsx']}
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/conf/deoplete.vim'

"---------------=== Разное ===------------------
  Plug 'chreekat/vim-paren-crosshairs'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 2
    let delimitMate_expand_space = 1


call plug#end()

colorscheme lucius
LuciusLightHighContrast

"set background=dark
"colorscheme gruvbox
"let g:gruvbox_contrast_light='hard'
"let g:gruvbox_contrast_dark='hard'
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
map <F2> :MundoToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :VimFilerExplorer -winwidth=25<CR>
"map <F4> :VimFiler -buffer-name=explorer -split -simple -winwidth=25 -toggle -no-quit<CR>
inoremap kj <Esc>
nnoremap <esc> :noh<return><esc>
"<TAB> for switch window
nnoremap <silent> <Tab> :wincmd w<CR>


function! SetUsLayout()
	silent !layoutswitch 0
endfunction
