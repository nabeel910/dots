" Use system clipboard
set clipboard+=unnamedplus
set mouse=a
syntax on
set ignorecase
set smartcase
set number 
set encoding=utf-8

call plug#begin()
Plug 'lilydjwg/colorizer'
Plug 'iandwelker/rose-pine-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'Mofiqul/dracula.nvim'
call plug#end()
colorscheme dracula
