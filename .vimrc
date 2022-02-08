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
set number
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a

call plug#begin('~/nvim/plugged')
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdtree'
    Plug 'itchyny/lightline.vim'
    Plug 'StanAngeloff/php.vim'
    Plug 'morhetz/gruvbox'

    """"" ncm2
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'phpactor/phpactor',  {'do': 'composer install', 'for': 'php'}

    """""

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap gd <C-]> 
nnoremap <leader><space> :nohlsearch<CR>

"" nerdtree config
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>o :NERDTreeFind<CR>

"" fuzzy finder config
let $FZF_DEFAULT_COMMAND = 'find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>

"" ncm2 config
set shortmess+=c 
