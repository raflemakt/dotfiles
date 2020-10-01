"   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"   ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"   ██║   ██║██║██╔████╔██║██████╔╝██║     
"   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"""				 VimRC - Gunnar Myhre 2020

source /usr/share/vim/vim82/defaults.vim

colorscheme delek
nnoremap <space> <C-W>

set nu rnu
set is ic smartcase	" search: iterative and case insensitive
set spelllang=en_gb,nn
set splitbelow splitright
set tabstop=4
filetype on
filetype plugin indent on


""" COMPILE/RUN SCRIPTS
" These crappy scripts should be rewritten to file extension specific cases.
map ;l :! pdflatex %<CR><CR> mupdf %
map ;p :! python %<CR>
map <F5> :! python %<CR>
map ;+ :! g++ % -o %:r && ./%:r <CR>
map ;R :! cargo run<CR>
map ;r :! rustc %<CR>
map ;s :source ~/.vimrc<CR>


""" KEYBINDS
" bypass the C-W leader in some cases of split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-Å> <C-]>

map \c a{}<Esc>i
map \p a()<Esc>i
map \b a[]<Esc>i

" Netrw file explorer <space>e, default to tree
let g:netrw_liststyle = 3
map <space>e	:Lex!<CR>:vertical resize 30<CR>
