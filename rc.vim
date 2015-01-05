" =======================================
" .vimrc siZors
" ======================================

" Generel setup
    set nocompatible                  " enable vim features

    set backupdir=$HOME/.cache/vim/backup
    set backup
    
    set directory=/tmp
    let g:SESSION_DIR = $HOME.'/.cache/vim/sessions'

    " If above directories don't exist, make them
    if finddir(&backupdir) == ''
        silent call mkdir(&backupdir, "p")
    endif

    if finddir(g:SESSION_DIR) == ''
        silent call mkdir(g:SESSION_DIR, "p")
    endif

    " Setup NeoBundle
    filetype off
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    let g:neobundle#types#get#clone_depth = 2
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#rc($HOME . '/.vim/bundle')
    filetype plugin indent on

    set t_Co=256
    if &t_Co >= 256 || has("gui_running")
        colorscheme jellybeans
    endif

    if &t_Co > 2 || has("gui_running")
        syntax on
    endif

" Options
    set title                         " show file name in window title
    set hidden                        " Edit multiple unsaved files at the same time
    set confirm                       " Prompt to save unsaved changes when exiting
    set viminfo='1000,f1,<500,:100,/100,h
    set history=1000                  " Remember more commands and search history
    set undolevels=1000               " Use many muchos levels of undo
    set ssop-=blank                   " Don't save blank window
    set ssop-=options                 " Don't save options
    set hlsearch                      " Highlight search terms
    set ignorecase                    " Ignore case when searching
    set smartcase                     " Ignore case if search pattern is lowercase, case-sensitive otherwise

" Display Options
    set title
    set scrolloff=4
    set sidescroll=4
    set sidescrolloff=10

" Tab options
    set autoindent                    " Copy indent from previous line
    set smartindent                   " Enable nice indent
    set expandtab                     " Tab with spaces
    set smarttab                      " Indent using shiftwidth
    set shiftwidth=4
    set softtabstop=4
    set shiftround                    " Drop unused spaces
    set backspace=indent,eol,start    " Allow backspace to remove indents, newlines and old tex

" Matching characters
    set showmatch                     " Show matching brackets
    set matchpairs+=<:>               " Make < and > match as well
    runtime macros/matchit.vim

" Tab completion in command line
    set wildmenu
    set wildmode=list:longest:full,full
    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.DS_Store                       " OSX bullshit
    set wildignore+=*.luac                           " Lua byte code
    set wildignore+=migrations                       " Django migrations
    set wildignore+=*.pyc                            " Python byte code
    set wildignore+=*.orig                           " Merge resolution files


" GUI SETTINGS
    set mouse=a
    set ttymouse=xterm2
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Undo settings
    set undofile
    set undodir=~/.vim/undodir
    set undolevels=1000       " Maximum number of changes that can be undone
    set undoreload=10000      " Maximum number of lines to save for undo on buffer reload

" Misc
    set clipboard+=unnamed            " Enable x-clipboard

" Keymap file
    source $HOME/.vim/map.vim

" Bundle file
"    source $HOME/.vim/bundle.vim

" Autocommands
if has('autocmd')
    "Put autocommands here
endif
