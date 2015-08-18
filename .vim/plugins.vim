call plug#begin('~/.vim/plugged')

let g:plug_threads = 1
Plug '2072/PHP-Indenting-for-VIm'
Plug 'Townk/vim-autoclose'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'joonty/vdebug'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tobyS/vmustache' |  Plug 'tobyS/pdv'
Plug 'tobyS/vmustache' |  Plug 'tobyS/php-accessors.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'elzr/vim-json', { 'for': 'css' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'Valloric/ListToggle'
Plug 'tpope/vim-fugitive'
call plug#end()
