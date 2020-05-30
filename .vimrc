set nocompatible              " be iMproved, required
filetype on		          " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'ajh17/spacegray.vim'
Plugin 'agude/vim-eldar'
Plugin 'challenger-deep-theme/vim'
Plugin 'trusktr/seti.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Default Color Schemes using .vim file
syntax on
set background=dark
set t_Co=256
set term=xterm-256color
set termguicolors

"colorscheme lanox
"colorscheme monokai-phoenix
""colorscheme elflord
"colorscheme challenger_deep
"colorscheme molokai
colorscheme seti
"colorscheme dracula
" Auto-close {}, ', ", [ ********************************************
" https://stackoverflow.com/questions/21316727/automatic-closing-brackets-for-vim
inoremap ' ''<left>
inoremap " ""<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>

" Environment *******************************************************
set tabstop=4		" number of spaces == TAB

set softtabstop=4	" number of spacesin tab when editing

set number		    " show line numbers

set ruler			" set ruler

set showmatch		" highlight matching [],{},()

syntax enable 		" enable syntax processing

set showcmd		    " show command in bottom bar

set laststatus=0	" Remove status line

set wildmenu		" visual autocomplete for command menu

set mouse=a			" To use mouse

set splitbelow			" To put :term below terminal, Geany style

set termwinsize=10x0	" Term size test

set encoding=utf-8		" utf-8 encoding

"Python setup   *****************************************************
" source: https://www.vimfromscratch.com/articles/vim-for-python/
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4""

"To fix indent issues ***********************************************
set expandtab
set shiftwidth=4
set softtabstop=4

" Add thin cursor | *************************************************
"set guicursor=i:ver25-iCursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Add NerdTree		*********************************************
" source1 = https://github.com/scrooloose/nerdtree/issues/915
" source2 = https://github.com/scrooloose/nerdtree
" https://vi.stackexchange.com/questions/18611/always-open-terminal-window-at-the-bottom
set rtp+=~/.vim/bundle/nerdtree
"autocmd VimEnter * NERDTree		" Execute NERDTree
"autocmd VimEnter * terminal
autocmd VimEnter * wincmd p		" Change cursor to editor console (To avoid term in NERDTree)
"autocmd VimEnter * terminal
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Map ctrl + n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Automatically remove all trailling whitespace
autocmd BufWritePre * %s/\s\+$//e
"Map F7 to full exit, vim with tree and term
"map <F7> :qa!<CR>

" jedi-vim configurations
" *************************************************
let g:jedi#use_tabs_not_buffers=1
