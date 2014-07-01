let g:unite_source_session_path = g:SESSION_DIR
let g:unite_source_history_yank_enable = 1
let g:unite_source_menu_menus = {}
let g:unite_enable_start_insert = 0
let g:unite_enable_short_source_mes = 0
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '>>> '
let g:unite_marked_icon = '✓'
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
let g:unite_source_buffer_time_format = '(%Y-%m-%d %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%Y-%m-%d %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%Y-%m-%d %H:%M:%S) '
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Setup Unite menu

" Menu for navigating buffers
let g:unite_source_menu_menus.navigation = {
            \ 'description' : '     navigate by buffers, tabs & windows                   ⌘ [space]b', }
let g:unite_source_menu_menus.navigation.command_candidates = [
        \['buffers                                ⌘ ,b', 'Unite buffer'],
        \['tabs', 'Unite tab'],
        \['windows', 'Unite window'],
        \['location list', 'Unite location_list'],
        \['quickfix', 'Unite quickfix'],
        \['new vertical window', 'vsplit'],
        \['new horizontal window', 'split'],
        \['close current window                   ⌘ ,cw', 'close'],
        \['toggle quickfix window                 ⌘ ,ll', 'normal ,ll'],
        \['delete buffer                          ⌘ ,bd', 'bd'],
    \]

" File's operations

    nnoremap <leader>uo :<C-u>Unite -no-split -start-insert file<CR>
    nnoremap <leader>uO :<C-u>Unite -no-split -start-insert file_rec/async:!<CR>
    nnoremap <leader>um :<C-u>Unite -no-split file_mru<CR>

    let g:unite_source_menu_menus.files = {
        \ 'description' : '          files & dirs                                          ⌘ [space]o',}

    let g:unite_source_menu_menus.files.command_candidates = [
        \['open file                                ⌘ ,uo', 'normal ,uo'],
        \['open file with recursive search          ⌘ ,uO', 'normal ,uO'],
        \['open more recently used files            ⌘ ,um', 'normal ,um'],
        \['edit new file', 'Unite file/new'],
        \['search directory', 'Unite directory'],
        \['search recently used directories', 'Unite directory_mru'],
        \['search directory with recursive search', 'Unite directory_rec/async'],
        \['make new directory', 'Unite directory/new'],
        \['change working directory', 'Unite -default-action=lcd directory'],
        \['know current working directory', 'Unite -winheight=3 output:pwd'],
        \['save as root                             ⌘ :w!!', 'exe "write !sudo tee % >/dev/null"'],
        \['quick save                               ⌘ ,w', 'normal ,w'],
    \]
    exe 'nnoremap <silent>[menu]o :Unite -silent -winheight='.(len(g:unite_source_menu_menus.files.command_candidates) + 2).' menu:files<CR>'

" Yanks, registers & history
    nnoremap <silent><Leader>ui :Unite -silent history/yank<CR>
    nnoremap <silent><Leader>ur :Unite -silent register<CR>

    let g:unite_source_menu_menus.registers = {
        \ 'description' : '      yanks, registers & history                            ⌘ [space]i'}

    let g:unite_source_menu_menus.registers.command_candidates = [
        \['yanks                                  ⌘ ,ui', 'Unite history/yank'],
        \['commands       (history)               ⌘ q:', 'Unite history/command'],
        \['searches       (history)               ⌘ q/', 'Unite history/search'],
        \['registers                              ⌘ ,ur', 'Unite register'],
        \['messages', 'Unite output:messages'],
        \['undo tree      (gundo)                 ⌘ ,uu', 'GundoToggle'],
    \]

" Text edition
    let g:unite_source_menu_menus.text = {
        \ 'description' : '           text edition                                          ⌘ [space]e'}
    let g:unite_source_menu_menus.text.command_candidates = [
        \['toggle search results highlight      ⌘ ,[space]', 'set invhlsearch'],
        \['toggle line numbers                  ⌘ ,on', 'call ToggleRelativeAbsoluteNumber()'],
        \['toggle wrapping                      ⌘ ,or', 'normal ,or'],
        \['show hidden chars                                          ⌘ ,ol', 'normal ,ol!'],
        \['toggle fold                          ⌘ /', 'normal za'],
        \['open all folds                       ⌘ zR', 'normal zR'],
        \['close all folds                      ⌘ zM', 'normal zM'],
        \['toggle paste mode                    ⌘ ,p', 'normal ,p'],
        \['show current char info               ⌘ ga', 'normal ga'],
    \]
    exe 'nnoremap <silent>[menu]e :Unite -silent -winheight='.(len(g:unite_source_menu_menus.text.command_candidates) + 2).' menu:text<CR>'

" Neobundle {{{
    let g:unite_source_menu_menus.neobundle = {
        \ 'description' : '      plugins administration with neobundle                 ⌘ [space]n'}
    let g:unite_source_menu_menus.neobundle.command_candidates = [
        \['neobundle', 'Unite neobundle'],
        \['neobundle log', 'Unite neobundle/log'],
        \['neobundle lazy', 'Unite neobundle/lazy'],
        \['neobundle update', 'Unite neobundle/update'],
        \['neobundle search', 'Unite neobundle/search'],
        \['neobundle install', 'Unite neobundle/install'],
        \['neobundle check', 'Unite -no-empty output:NeoBundleCheck'],
        \['neobundle docs', 'Unite output:NeoBundleDocs'],
        \['neobundle clean', 'NeoBundleClean'],
        \['neobundle list', 'Unite output:NeoBundleList'],
        \['neobundle direct edit', 'NeoBundleDirectEdit'],
    \]

    exe 'nnoremap <silent>[menu]n :Unite -silent -winheight='.(len(g:unite_source_menu_menus.neobundle.command_candidates) + 2).' menu:neobundle<CR>'

" Vim
    let g:unite_source_menu_menus.vim = {
        \ 'description' : '            vim                                                   ⌘ [space]v'}

    let g:unite_source_menu_menus.vim.command_candidates = [
        \['choose colorscheme', 'Unite colorscheme -auto-preview'],
        \['mappings', 'Unite mapping -start-insert'],
        \['edit configuration file (vimrc)', 'edit $HOME/.vim/rc.vim'],
        \['vim help', 'Unite -start-insert help'],
        \['vim commands', 'Unite -start-insert command'],
        \['vim functions', 'Unite -start-insert function'],
        \['vim runtimepath', 'Unite -start-insert runtimepath'],
        \['vim command output', 'Unite output'],
        \['unite sources', 'Unite source'],
        \['kill process', 'Unite -default-action=sigkill process'],
        \['launch executable (dmenu like)', 'Unite -start-insert launcher'],
    \]

    exe 'nnoremap <silent>[menu]v :Unite -silent -winheight='.(len(g:unite_source_menu_menus.vim.command_candidates) + 2).' menu:vim<CR>'

nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]
nnoremap <silent>[menu]u :Unite -silent -winheight=12 menu<CR>
