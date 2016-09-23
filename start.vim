scriptencoding utf-8
" Enable nocompatible
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
endif
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
let s:Psep = ':'
let s:Fsep = '/'


"Vim settings
let g:settings                         = get(g:, 'settings', {})
let g:settings.colorscheme             = 'lucius'
let g:settings.plugin_bundle_dir       = $HOME. join(['', '.cache', 'vimfiles', ''],s:Fsep)
let g:settings.dein_installed          = 0
let g:settings.checkinstall            = 0

