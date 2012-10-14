syntax enable
syntax on

" Solarized
let g:solarized_contrast="normal"
let g:solarized_termtrans=1
let g:solarized_bold=0
colorscheme solarized

set background=dark

set ls=2            " allways show status line
set ruler           " show the cursor position all the time
set number          " show line numbers


" Tab settings
set expandtab
set tabstop=2
set shiftwidth=2

" Indent settings
set smartindent
set nocompatible
filetype plugin indent on " Enable filetype-specific indenting and plugins

cmap w!! %!sudo tee %
