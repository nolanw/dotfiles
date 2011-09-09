" Load pathogen for bundle management.
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Suck it, vi.
set nocompatible

" Suck it, modelines.
set modelines=0

" Syntax highlighting.
so $HOME/.vim/myfiletypes.vim
syntax on
filetype plugin indent on

" Colors.
set background=dark
colorscheme solarized

" Temporary file stuff.
set noswapfile
set backupdir=~/.tmp
set directory=~/.tmp

" There is no other encoding.
set encoding=utf-8

" Show some context.
set scrolloff=3
set showmode
set showcmd
set cursorline
set ruler
set relativenumber

" Nicer completion.
set wildmenu
set wildmode=list:longest

" Backspace right on over.
set backspace=indent,eol,start

" Indentation.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Normal regex.
nnoremap / /\v
vnoremap / /\v

" Remap leader key.
let mapleader = ","

" Search for what I want.
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader>a :Ack

" Then leave me alone.
nnoremap <leader><space> :noh<cr>

" Map bracket pairs with tab.
nnoremap <tab> %
vnoremap <tab> %

" Pretty long lines.
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Shift is lame.
nnoremap ; :

" Re-format paragraphs.
nnoremap <leader>q gqip

" Handy splits and split movements.
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" HTML handiness.
source ~/.vim/bundle/sparkup/vim/ftplugin/html/sparkup.vim

