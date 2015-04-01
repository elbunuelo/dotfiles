set encoding=utf-8

"Reload .vimrc when it's written to
autocmd! bufwritepost .vimrc source %

"Rebind <Leader>
let mapleader = ","

"Remove highlighting
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Tab Switch
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"Pane Switch
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Sorting
vnoremap <Leader>s :sort<CR>

"Enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"Para cuando el statusLine solo aparece en split
set laststatus=2

"Run pathogen
execute pathogen#infect()

syntax on
filetype plugin indent on
