let g:Config_Main_Home = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.((has('win16') || has('win32') || has('win64'))?'\':'/') . '?')
try
    call zvim#util#source_rc('functions.vim')
catch
    execute "set rtp +=" . fnamemodify(g:Config_Main_Home, ':p:h:h')
    call zvim#util#source_rc('functions.vim')
endtry

call zvim#util#source_rc('start.vim')
scriptencoding utf-8
call zvim#util#source_rc('/plugins.vim')
call zvim#util#source_rc('/general.vim')
call zvim#util#source_rc('/mappings.vim')
