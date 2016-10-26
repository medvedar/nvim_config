if &compatible
  set nocompatible
endif

set runtimepath+=/home/medar/.cache/nvimfiles/dein/repos/github.com/Shougo/dein.vim
let g:settings = get(g:, 'settings', {})
let g:settings.plugin_bundle_dir = "/home/medar/.cache/nvimfiles/plug"
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/general.vim'
