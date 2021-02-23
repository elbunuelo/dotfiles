call plug#begin('~/.vim/plugged')

let g:plug_threads = 1

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive' | Plug 'idanarye/vim-merginal'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
"Plug 'vimwiki/vimwiki'
"Plug 'mattn/calendar-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'vim-scripts/indentpython.vim'
"Plug 'tmhedberg/SimpylFold'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'blueyed/vim-diminactive'
Plug 'tweekmonster/django-plus.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-ruby/vim-ruby'

call plug#end()
