set encoding=utf-8

"Reload .vimrc when it's written to
autocmd! bufwritepost .vimrc source %

"Rebind <Leader>
let mapleader = ","

"Remove highlighting
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

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
