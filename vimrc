" Load pathogen for bundle management.
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

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

