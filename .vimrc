set nocompatible              " be iMproved, required
filetype off		          " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'dracula/vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'justmao945/vim-clang'
Plugin 'sainnhe/edge'
Plugin 'ajh17/spacegray.vim'
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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" Default Color Schemes using .vim file
syntax on
set background=dark 
set termguicolors 

"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'

"colorscheme torte				" *
"colorscheme lanox				" *
colorscheme monokai-phoenix	" *
"colorscheme molokai
"colorscheme edge 
"colorscheme spacegray
"color dracula
" ***** Deep_Space Color **********
"set background=dark
"set termguicolors 
"colorscheme deep-space
"let g:airline_theme='deep_space'
" ******* Afterglow ********
"colorscheme afterglow 
"let g:airline_theme='afterglow'

" Environment ###############################################
set tabstop=4		" number of spaces == TAB

set softtabstop=4	" number of spacesin tab when editing

set number		    " show line numbers

set showmatch		" highlight matching [],{},() 

syntax enable 		" enable syntax processing

set showcmd		    " show command in bottom bar

set cursorline		" highlight current line

set wildmenu		" visual autocomplete for command menu

set t_Co=256

set term=xterm-256color

set splitbelow			" To put :term below terminal, Geany style

set termwinsize=10x0	" Term size test

" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Add thin cursor | ********************************************
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
"Map F7 to full exit, vim with tree and term
"map <F7> :qa!<CR>

" jedi-vim configurations
" *************************************************
let g:jedi#use_tabs_not_buffers = 1
" YCM (c completions)
" ***************************************************
let g:ycm_global_ycm_extra_conf = '/home/g3rs0n/prgramming/C/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" vim-clang *****************************************
let g:clang_c_options = '-std=gnu11'
