call plug#begin('~/.vim/plugged')

let g:plug_threads = 1

Plug '2072/PHP-Indenting-for-VIm'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/ListToggle'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'godlygeek/tabular'
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'joonty/vdebug'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'tobyS/vmustache' | Plug 'SirVer/ultisnips' |  Plug 'tobyS/pdv'
Plug 'tobyS/vmustache' |  Plug 'tobyS/php-accessors.vim'
Plug 'tpope/vim-fugitive' | Plug 'idanarye/vim-merginal'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'

call plug#end()
