set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on
colorscheme zenburn

set directory=~/.backup

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

