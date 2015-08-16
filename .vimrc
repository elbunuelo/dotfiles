
"Plugins configuration
source ~/.vim/plugins.vim

"Reload .vimrc when it's written to
autocmd! bufwritepost .vimrc source %

"Rebind <Leader>
let mapleader = ","

"Remove highlighting
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Tab handling
map <Leader>t <esc>:tabnew<CR>
map <Leader>w <esc>:tabclose<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"Pane handling
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" Move to the window in the direction specified or open a new one
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"Sorting
vnoremap <Leader>s :sort<CR>

"Indenting and unindenting
vnoremap < <gv
vnoremap > >gv

"Highlight Whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"Color scheme
set t_Co=256
color wombat256mod

"Enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"Para cuando el statusLine solo aparece en split
set laststatus=2

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
set shiftwidth=4
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

"Equals align
map <Leader>a <esc>:Tab /=<CR>

"Rockets align
map <Leader>A <esc>:Tab /=><CR>

"Break lines with K
nnoremap K i<CR><esc>

"Ctrlp settings
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 1

"Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phplint']
let g:syntastic_quiet_messages = {'level': 'warnings'}

"Php documentor configuration
au BufRead,BufNewFile *.php inoremap <buffer> <Leader>c :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <Leader>c :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <Leader>c :call PhpDocRange()<CR>
let g:pdv_cfg_php4always = 1

"Nerdtree
map <Leader>n <esc>:NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

"Enable matchit for html matching with %
runtime macros/matchit.vim

"Syntastic configuration
let g:syntastic_auto_loc_list = 0
let g:syntastic_error_symbol='✗'

"Json Configuration
"Don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

