scriptencoding utf-8
set backspace=indent,eol,start

set number
set nuw=4
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

set autoindent
set smartindent
set cindent

set wildmenu
set linebreak

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

exec 'colorscheme '. g:settings.colorscheme
LuciusDarkLowContrast

" Show trailing whitespace as red
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

set ignorecase smartcase
set cursorline

set wildignore=*.swp,*.bak,*.pyc,*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignorecase
set scrolloff=3
set breakindent
set splitbelow
set splitright

