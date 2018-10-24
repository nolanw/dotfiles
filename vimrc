" Make plugins work; if needed, install pathogen.vim from https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Highlight syntax
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Automatically reload files that change outside of vim
set autoread

" Pretty TextMate-y colors
colorscheme twilight256

" vim-javascript configuration
let g:javascript_plugin_jsdoc = 1

