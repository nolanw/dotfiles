" nolanw's vimrc
" vim:set ts=2 sts=2 sw=2 expandtab:

" cool stuff from:
"   * https://github.com/garybernhardt/dotfiles/blob/master/.vimrc

" make plugins work; if needed, install pathogen.vim from https://github.com/tpope/vim-pathogen
execute pathogen#infect()

set nocompatible
" allow unsaved background buffers
set hidden
set history=10000
" spaces ftw
set expandtab
set tabstop=4
set shiftwidth=0 " 0 means 'match tabstop'
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" searches case-sensitive only if they contain uppercase characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
" always show tab bar
set showtabline=2
set scrolloff=3
" no backups
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/tmp
" backspace over everything in insert mode
set backspace=indent,eol,start
set showcmd
" highlight syntax
syntax on
" enable file type detection and do language-dependent indenting
filetype plugin indent on
set wildmode=longest,list
set wildmenu
set modeline
set modelines=3
set foldmethod=manual
set nofoldenable
" only one space when joining lines with sentence-terminating punctuation
set nojoinspaces
" automatically reload files that change outside of vim
set autoread

" vim-javascript configuration: enable syntax highlighting in jsdoc
let g:javascript_plugin_jsdoc = 1

" Override some of the above settings for certain file types
augroup filetypeSpecific
  autocmd!
  autocmd FileType gitcommit set tw=0 " I don't need the wrap
	autocmd FileType javascript set ts=2 sw=2 sts=2 smartindent nocindent
  autocmd FileType python set sw=4 sts=4 et
  autocmd FileType ruby,haml,eruby,sass,cucumber set ai sw=2 sts=2 et
augroup END

:set t_Co=256
:set background=dark
:color twilight256

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" multipurpose tab key: indent if beginning of line, else completion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

