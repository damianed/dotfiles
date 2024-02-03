" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

let mapleader = ','
set number relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set termguicolors
set background=dark

call plug#begin('~/nvim/plugged')
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdtree'
    Plug 'itchyny/lightline.vim'
    Plug 'StanAngeloff/php.vim'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'jwalton512/vim-blade'
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'airblade/vim-gitgutter'
call plug#end()

colorscheme gruvbox

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader><space> :nohlsearch<CR>
inoremap {<CR> {<CR>}<Esc>ko
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
vnoremap . :norm.<CR>
vnoremap <C-Y> "+y


"" nerdtree config
nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <leader>o :NERDTreeFind<CR>

"" fuzzy finder config
let $FZF_DEFAULT_COMMAND = 'find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>

"" ncm2 config
set shortmess+=c

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
" press enter to select an option from the pup up menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"" vim-blade
" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }


"" vim-php-namespaces
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

"" remove white spaces from files
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MY_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"" coc.vim config
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <F10> :split \| :term php artisan test %<CR>:startinsert<CR>
