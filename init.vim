syntax enable
set tabstop=4 
set background=dark
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set showcmd
set cursorline
set ruler
call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'leafOfTree/vim-svelte-plugin'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
" colorscheme tokyonight-storm"
