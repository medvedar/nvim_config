scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let g:Config_Main_Home = '/home/medar/.config/nvim'
fu! zvim#util#source_rc(file)
    if filereadable(g:Config_Main_Home. '/' . a:file)
        execute 'source ' . g:Config_Main_Home  . '/' . a:file
    endif
endf


let &cpo = s:save_cpo
unlet s:save_cpo
