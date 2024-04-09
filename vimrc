set cursorline

syntax on

set backspace=indent,eol,start

set scrolloff=3

set showcmd

set backupdir=/tmp
set directory=/tmp

set nojoinspaces

set autoread

" Tabs tabs tabs
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=4
set autoindent

" File type-specific overrides
augroup filetypeSpecific
    autocmd!
    autocmd FileType gitcommit set textwidth=0
augroup END
