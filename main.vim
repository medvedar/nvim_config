" Настраиваем поиск
set ignorecase smartcase
set cursorline

set foldmethod=syntax
"set t_Co=256
"set wildmode=list:longest
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
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

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
" Plug 'morhetz/gruvbox'
	Plug 'jonathanfilip/vim-lucius'
" Plug 'mhartington/oceanic-next'
" Plug 'NLKNguyen/papercolor-theme'
  Plug 'vim-airline/vim-airline-themes'

"------------ Стартовый экран ------------------
	Plug 'mhinz/vim-startify'
    let g:startify_custom_header =
          \ map(split(system('date'), '\n'), '"   ". v:val') + [
          \ ' ____    __    ____  _______  __        ______   ______   .___  ___.  _______',
          \ ' \   \  /  \  /   / |   ____||  |      /      | /  __  \  |   \/   | |   ____|',
          \ '  \   \/    \/   /  |  |__   |  |     |  ,---- |  |  |  | |  \  /  | |  |__',
          \ '   \            /   |   __|  |  |     |  |     |  |  |  | |  |\/|  | |   __|',
          \ '    \    /\    /    |  |____ |  `----.|  `----.|  `--   | |  |  |  | |  |____',
          \ '     \__/  \__/     |_______||_______| \______| \______/  |__|  |__| |_______|',
          \ '']
    let g:startify_custom_footer = [
          \'',
          \'']
    let g:startify_list_order = [
          \ ['  Most recently used files:'],
          \ 'files',
          \ ['  Sessions:'],
          \ 'sessions',
          \ ['  Bookmarks:'],
          \ 'bookmarks',
          \ ]
    let g:startify_bookmarks = [ '~/.config/nvim/init.vim' ]

"--------- Умная строка состояния --------------
	Plug 'bling/vim-airline'
    " TODO:
    "   - configure
    "   - move in separate file
		let g:airline_powerline_fonts = 1
		let g:airline#extensions#tabline#left_sep = ' '
		let g:airline#extensions#tabline#left_alt_sep = '|'
		let g:airline#extensions#tabline#enabled=1
		set laststatus=2

"--------- Визуализация undo tree --------------
	Plug 'mbbill/undotree'
		if has("persistent_undo")
			set undodir=~/.config/nvim/.undodir/
			set undofile
		endif

"------- Навигация по коду/проекту -------------
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
		let NERDTreeShowHidden=1
  Plug 'majutsushi/tagbar'
	Plug 'Shougo/unite.vim'
  Plug 'Lokaltog/vim-easymotion'
"--------------- Git ----------------------
  Plug 'tpope/vim-fugitive'
  Plug 'cohama/agit.vim', {'on': 'Agit'}
  Plug 'gregsexton/gitv', {'on': 'Gitv'}

  Plug 'Yggdroot/indentLine'
    " TODO:
    "   - mayby configure

  Plug 'scrooloose/nerdcommenter'

  Plug 'neomake/neomake', {'on': 'Neomake'}
    " TODO:
    "   - configure
    autocmd! BufWritePost * Neomake
    let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
    let g:neomake_javascript_enabled_makers = ['jshint']

"-----------=== Поддержка языков ===------------
"----- Python
"	Plug 'klen/python-mode'
"		let g:pymode_lint_cwindow = 0
		"let g:pymode_rope = 0


"----- Emmet
  Plug 'mattn/emmet-vim', { 'for': ['html','xhtml','css','sass','scss','xml', 'php'] }
    au FileType html,css,php,sass,scss,less imap <expr>jk  emmet#expandAbbrIntelligent("\<tab>")
  Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss' ]}

  Plug 'elzr/vim-json', {'for': ['javascript','javascript.jsx', 'json']}
  Plug 'Valloric/MatchTagAlways'

  Plug 'othree/html5.vim',           { 'for': ['html', 'php'] }
"   let g:html5_event_handler_attributes_complete = 0
"   let g:html5_rdfa_attributes_complete          = 0
"   let g:html5_microdata_attributes_complete     = 0
"   let g:html5_aria_attributes_complete          = 0

  Plug 'hail2u/vim-css3-syntax',    { 'for': ['html','css', 'sass', 'scss'] }
       augroup VimCSS3Syntax
           autocmd!
           autocmd FileType css setlocal iskeyword+=-
       augroup END

" Plug 'groenewege/vim-less',       { 'for': ['less']   }

  Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss']   }
    autocmd FileType scss set iskeyword+=-

  Plug 'pangloss/vim-javascript',      { 'for': ['javascript', 'javascript.jsx', 'html'] }
  Plug 'othree/javascript-libraries-syntax.vim',{ 'for': ['javascript', 'javascript.jsx', 'html'] }
    let g:used_javascript_libs = 'jquery,react,flux'
  Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0

  Plug 'plasticboy/vim-markdown'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  Plug 'honza/vim-snippets'


"--------------=== Автокомплит ===---------
"----- Deoplete
" TODO:
"   - configure autocomplete, jspc looks not work
"   - move to separate file
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'carlitux/deoplete-ternjs', {'for': ['javascript', 'javascript.jsx']}
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
    let g:deoplete#omni#functions = {}
    let g:deoplete#omni#functions.javascript = 'tern#Complete'
    set completeopt=longest,menuone,preview
    let g:deoplete#sources = {}
    let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer', 'omni']
    let g:tern_request_timeout = 1
    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
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
      autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup en
"---------------=== Разное ===------------------
  Plug 'chreekat/vim-paren-crosshairs'

" Plug 'tpope/vim-commentary'


  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
"Plug 'airblade/vim-gitgutter'


"  Plug 'scrooloose/syntastic', { 'for': ['html','css', 'sass', 'scss'] }
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"   set statusline+=%*

"   let g:syntastic_always_populate_loc_list = 1
"   let g:syntastic_auto_loc_list = 1
"   let g:syntastic_check_on_open = 1
"   let g:syntastic_check_on_wq = 0
"   let g:syntastic_html_tidy_ignore_errors = [ 'trimming empty <i>',
"         \'trimming empty <ul>',
"         \'trimming empty <li>',
"         \'trimming empty <button>',
"         \'<svg> proprietary attribute "xmlns:xlink"' ]

  Plug 'ryanoasis/vim-devicons'

call plug#end()

  colorscheme lucius
  LuciusDarkLowContrast
"  set background=dark
"  colorscheme gruvbox




"map       <Space>      <Leader>
nnoremap <silent> <leader>bb :<C-u>Unite buffer<CR>
map <space> <Plug>(easymotion-prefix)
map <F2> :UndotreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :NERDTreeToggle<CR>
map <Home> :vsp<cr><C-w>l<esc>:e ./<cr>
inoremap kj <Esc>
nnoremap <esc> :noh<return><esc>
"<TAB> for switch window
nnoremap <silent> <Tab> :wincmd w<CR>


function! SetUsLayout()
	silent !layoutswitch 0
endfunction
