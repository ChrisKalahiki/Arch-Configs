set nocompatible
set showmatch
set ignorecase
set mouse=v
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=80
filetype plugin indent on
syntax on
" set mouse=on
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast

" vim-plug section
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
