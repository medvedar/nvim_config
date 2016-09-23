scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.CustomKeyMaps = {'description': 'Custom mapped keyboard shortcuts                   [unite]<SPACE>'}
let g:unite_source_menu_menus.CustomKeyMaps.command_candidates = get(g:unite_source_menu_menus.CustomKeyMaps,'command_candidates', [])
let g:unite_source_menu_menus.MyStarredrepos = {'description': 'All github repos starred by me                   <leader>ls'}
let g:unite_source_menu_menus.MyStarredrepos.command_candidates = get(g:unite_source_menu_menus.MyStarredrepos,'command_candidates', [])
let g:unite_source_menu_menus.MpvPlayer = {'description': 'Musics list                   <leader>lm'}
let g:unite_source_menu_menus.MpvPlayer.command_candidates = get(g:unite_source_menu_menus.MpvPlayer,'command_candidates', [])
fu! zvim#util#defineMap(type,key,value,desc,...)
    exec a:type . ' ' . a:key . ' ' . a:value
    let description = "➤ "
                \. a:desc
                \. repeat(' ', 80 - len(a:desc) - len(a:key))
                \. a:key
    let cmd = len(a:000) > 0 ? a:000[0] : a:value
    call add(g:unite_source_menu_menus.CustomKeyMaps.command_candidates, [description,cmd])

endf
fu! zvim#util#source_rc(file)
    if filereadable(g:Config_Main_Home. '/' . a:file)
        execute 'source ' . g:Config_Main_Home  . '/' . a:file
    endif
endf


let &cpo = s:save_cpo
unlet s:save_cpo
