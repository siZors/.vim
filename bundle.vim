" bundle.vim
" This file configures NeoBundle

" Utilities
    " Let NeoBundle manage itself
    NeoBundleFetch 'Shougo/neobundle.vim'

    " Interactive command execution in Vim
    NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \   'windows' : 'make -f make_mingw32.mak',
        \   'cygwin' : 'make -f make_cygwin.mak',
        \   'mac' : 'make -f make_mac.mak',
        \   'unix' : 'make -f make_unix.mak',
        \   }
        \ }

    " Disable plugins for files over 100 MB
    NeoBundle 'LargeFile'

    " Browse the vim undo tree
    NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
    nnoremap <leader>z :GundoToggle<CR>

    " Browse file structure with Nerd Tree
    NeoBundle 'scrooloose/nerdtree'

    let NERDTreeWinSize = 30
    " Files and directores to ignore in NERDTree
    let NERDTreeIgnore=['\~$', '\.AppleDouble$', '\.beam$', 'build$',
    \'dist$', '\.DS_Store$', '\.egg$', '\.egg-info$', '\.la$',
    \'\.lo$', '\.\~lock.*#$', '\mo$', '\.o$', '\,pt.cache$',
    \'\.pyc$', '\.pyo$', '__pycache__$', '\.Python$', '\..*.rej$',
    \'\.rej$', '\.ropeproject$', '\.svn$', '\.tags$' ]
    nnoremap <silent> <leader>t :NERDTreeToggle<CR>

    " Show objects in current file in window when coding in object orented language
    NeoBundle "majutsushi/tagbar"
    nnoremap <leader>i :TagbarToggle<CR>

    " Awesome status bar
    NeoBundle 'bling/vim-airline'
    let g:airline_detect_iminsert = 1
    let g:airline_enable_branch = 1
    let g:airline_enable_syntastic = 1
    let g:airline_left_sep = '⮀ '
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep ='⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_branch_prefix = '⭠'
    let g:airline_readonly_symbol = '⭤'
    let g:airline_linecolumn_prefix = '⭡'
    set laststatus=2   " Always show the bar


    " Select quotes in and out. Press enter in normal mode, + and -
    NeoBundle "gcmt/wildfire.vim"
    let g:wildfire_fuel_map = "="
    let g:wildfire_water_map = "-"

" Languages
    " Python
    NeoBundle "klen/python-mode"
    let g:pymode_folding = 1
    let g:pymode_run = 1
    let g:pymode_run_bind = '<leader>r'
    let g:pymode_lint_checkers = ['pylint', 'pep8', 'pep257', 'pyflakes', 'mccabe']
    let pymode_lint_unmodified = 1
    let g:pymode_rope_lookup_project = 0
    let g:pymode_rope_completion = 1
    let g:pymode_rope_complete_on_dot = 1
    let g:pymode_rope_completion_bind = '<C-Space>'
    let g:pymode_syntax = 1
    let g:pymode_syntax_slow_sync = 1

    " Matlab
    NeoBundle "vim-scripts/matlab.vim"

    " NERD Comment Tool
    NeoBundle 'scrooloose/nerdcommenter'
    let NERDSpaceDelims = 1
    let g:NERDCustomDelimiters = { 'ansible' : { 'left': '#'} }

" Unite
    NeoBundle "Shougo/unite.vim"
    NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
    NeoBundleLazy 'Shougo/unite-session', {'autoload':{'unite_sources':'session',
        \ 'commands': ['UniteSessionSave', 'UniteSessionLoad']}}
    NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources':
        \ ['quickfix', 'location_list']}}
    NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : 
        \ { 'unite_sources' : ['history/command', 'history/search']}}
    NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources': 'colorscheme'}}
    NeoBundleLazy 'tsukkee/unite-help', {'autoload':{'unite_sources':'help'}}
    source $HOME/.vim/unite.vim

    NeoBundle 'mhinz/vim-startify'

" A fancy start screen

    NeoBundle 'mhinz/vim-startify'
    let g:startify_session_dir = g:SESSION_DIR
    let g:startify_change_to_vcs_root = 1
    let g:startify_list_order = [
        \   ['   Last recently opened files:'],
        \    'files',
        \   ['   My sessions:'],
        \    'sessions',
        \ ]
    let g:startify_custom_header = [
        \ '           ______________________________________           ',
        \ '  ________|                                      |_______   ',
        \ '  \       |         VIM ' . v:version . ' - www.vim.org        |      /   ',
        \ '   \      |                                      |     /    ',
        \ '   /      |______________________________________|     \    ',
        \ '  /__________)                                (_________\   ',
        \ '']

NeoBundle 'dahu/LearnVim'
