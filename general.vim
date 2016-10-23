scriptencoding utf-8
set backspace=indent,eol,start

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

colorscheme lucius
LuciusLightHighContrast

inoremap kj <Esc>
nnoremap <esc> :noh<return><esc>
"<TAB> for switch window
nnoremap <silent> <Tab> :wincmd w<CR>
