" This line makes pacman-installed global Arch Linux vim packages work.
" source /usr/share/nvim/archlinux.vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
autocmd FileType c,cpp nnoremap <buffer> <F5> :split \| terminal ./build/build.sh<CR>
""autocmd FileType cpp nnoremap <buffer> <F5> :split \| terminal ./code/build.sh<CR>
source ~/.vimrc

