syntax enable
syntax on

" set background=dark
colorscheme delek
" let g:solarized_termcolors=256

set modelines=0 
 
set encoding=utf-8 

set ls=2            " allways show status line
set ruler

" These settings is for identation
set expandtab
set shiftwidth=2
set softtabstop=2

cmap w!! %!sudo tee %


" Avoid HOLD+SHIFT to every command
nnoremap ; :

" Identation
vnoremap < <gv
vnoremap > >gv


" Don't care about uppercase anymore
cmap W w
cmap Q q

set ignorecase  " ignore case when search
set smartcase   " ignore case if ALL lowercase, case-sensitive otherwise
set hlsearch    " highlight search terms

call pathogen#infect() 
