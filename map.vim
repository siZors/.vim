" Keymaps
"
" Set leader key
let mapleader = ','
let maplocalleader = "\\"

" Misc
nnoremap ; :

" Quickly edit .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Let jk exit insert mode
imap jk <Esc>

" Clear highlighted search terms
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Bundles
" Gundo, browse the undo tree
nnoremap <leader>z :GundoToggle<CR>
" NerdTree, browse files
" nnoremap <leader>t :NERDTreeToggle<CR>
" Show objects in current file when coding in object orented language
nnoremap <leader>i :TagbarToggle<CR>

" Unite
" Open Unite menu
nnoremap <leader>u :Unite menu<CR>
