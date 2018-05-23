syntax on
set number
au FileType gitcommit set tw=72
map <silent> <C-n> :NERDTreeFocus<CR>
set backspace=2
set tabstop=4
set expandtab
set shiftwidth=2
set mouse=a

let g:jsx_ext_required = 0
imap jj <Esc>

execute pathogen#infect()
call pathogen#helptags()
