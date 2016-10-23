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
    let g:startify_bookmarks = [ '~/.config/nvim/main.vim',
          \ '~/.config/vim/vimrc']
