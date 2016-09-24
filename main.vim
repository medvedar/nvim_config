" Настраиваем поиск
set ignorecase smartcase
set cursorline

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
"Plug 'morhetz/gruvbox'
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
  Plug 'tpope/vim-fugitive'
  Plug 'cohama/agit.vim', {'on': 'Agit'}
  Plug 'gregsexton/gitv', {'on': 'Gitv'}
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdcommenter'
  Plug 'neomake/neomake'

"-----------=== Поддержка языков ===------------
"----- Python
"	Plug 'klen/python-mode'
"		let g:pymode_lint_cwindow = 0
		"let g:pymode_rope = 0


"----- Emmet
  Plug 'mattn/emmet-vim', { 'for': ['html','xhtml','css','sass','scss','xml', 'php'] }
    au FileType html,css,php,sass,scss,less imap <expr>jk  emmet#expandAbbrIntelligent("\<tab>")
  Plug 'ap/vim-css-color', { 'for': ['html', 'xhtml', 'css', 'sass', 'scss', 'xml', 'php']}

  Plug 'elzr/vim-json', {'for': ['javascript', 'json']}
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

  Plug 'pangloss/vim-javascript',      { 'for': ['javascript', 'html'] }
  Plug 'othree/javascript-libraries-syntax.vim'
    let g:used_javascript_libs = 'jquery,react,flux'
  Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0

  Plug 'plasticboy/vim-markdown'


"--------------=== Автокомплит ===---------
"----- Deoplete
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } | Plug 'carlitux/deoplete-ternjs'
   let g:deoplete#enable_at_startup = 1
   let g:tern_request_timeout = 1
   if !exists('g:deoplete#omni#input_patterns')
     let g:deoplete#omni#input_patterns = {}
   endif
   " let g:deoplete#disable_auto_complete = 1
   autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
   " omnifuncs
   augroup omnifuncs
     autocmd!
     autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
     autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
     autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
     autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
   augroup en

  Plug 'carlitux/deoplete-ternjs'
    let g:tern_request_timeout = 1
    let g:tern#command = ["tern"]
    let g:tern#arguments = ["--persistent"]
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
"---------------=== Разное ===------------------
  Plug 'chreekat/vim-paren-crosshairs'

" Plug 'benekastah/neomake'
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

"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"nnoremap <silent> <right> :bn<CR>
"nnoremap <silent> <left> :bp<CR>

function! SetUsLayout()
	silent !layoutswitch 0
endfunction
