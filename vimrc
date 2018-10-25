" Make plugins work; if needed, install pathogen.vim from https://github.com/tpope/vim-pathogen
execute pathogen#infect()

set nocompatible

" Spaces ftw
set expandtab
set tabstop=4
set shiftwidth=0 " 0 means 'match tabstop'
set softtabstop=4
set autoindent

" Highlight syntax
syntax on

" Highlight current line
set cursorline

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Automatically reload files that change outside of vim
set autoread

" Make searches case-sensitive only if there are any uppercase characters
set ignorecase smartcase

" Pretty TextMate-y colors
colorscheme twilight256

" vim-javascript configuration: enable syntax highlighting in jsdoc
let g:javascript_plugin_jsdoc = 1

" Override some of the above settings for certain file types
augroup filetypeSpecific
    autocmd!
	autocmd FileType javascript set ts=2 sw=2 sts=2 smartindent nocindent
augroup END
