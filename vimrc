" Load pathogen for bundle management.
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Syntax highlighting.
syntax on

" File type detection and indentation.
filetype plugin indent on

" Temporary file stuff.
set noswapfile
set backupdir=~/.tmp
set directory=~/.tmp

