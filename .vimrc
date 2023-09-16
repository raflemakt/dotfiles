"   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"   ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"   ██║   ██║██║██╔████╔██║██████╔╝██║     
"   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"""				 VimRC - Gunnar Myhre 2020

source /usr/share/vim/vim90/defaults.vim


colorscheme delek   " legacy version in ~/.vim/colors
nnoremap <space> <C-W>

set nu rnu
set noswapfile		" swapfiles are more annoying than helpful
set is ic smartcase	" search: iterative and case insensitive
set spelllang=en_gb,nn
set splitbelow splitright
set tabstop=4 shiftwidth=0
set expandtab
set clipboard=unnamedplus
filetype on
filetype plugin indent on


""" COMPILE/RUN SCRIPTS
" These crappy scripts should be rewritten to file extension specific cases.
map ;l :! pdflatex %<CR>
map ;p :! python %<CR>
map <F5> :! python %<CR>
map ;+ :! g++ % -o %:r && ./%:r <CR>
map ;c :! gcc % -o %:r -lm&& ./%:r <CR>
map ;C :! gcc % -o %:r -lncurses && ./%:r <CR>
"map <F2> :! make && ./%:r <CR>
map <F2> :! make && make run <CR>
map <F3> :! make flash <CR>
map ;R :! cargo run<CR>
map ;r :! rustc %<CR>
map ;L :! clisp %<CR>
map ;n :! node %<CR>
map ;h :! ghc -dynamic % -o %:r && ./%:r <CR>
map ;s :source ~/.vimrc<CR>
map ;m :! octave % <CR>

""" It is not stupid if it ... /appended .pdf on 10423 filenames/
map ;æ :%s/$/.pdf/g<CR>


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
map <space>t	:terminal<CR>

