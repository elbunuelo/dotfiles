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

"Indenting and unindenting
vnoremap < <gv 
vnoremap > >gv

"Highlight Whitespace
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

"Color scheme
set t_Co=256
color wombat256mod

"Enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"Para cuando el statusLine solo aparece en split
set laststatus=2

"Run pathogen
execute pathogen#infect()

"Enable syntax highlighting
filetype off
syntax on
filetype plugin indent on

"Line numbers and length
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

"History management
set history=700
set undolevels=700

"Using spaces for indentation
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

"Making search a little smarter
set hlsearch
set incsearch
set ignorecase
set smartcase

"Eliminate auxiliary files
set nobackup
set nowritebackup
set noswapfile

"Ctrlp settings
let g:ctrlp_max_height = 30

