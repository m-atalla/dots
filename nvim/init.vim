" tab/indent options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Test config 'custom scripts'
set exrc

" relative/current line options
set relativenumber
set nu

" Hides search term after finding it
set nohlsearch 

set noerrorbells
set nowrap
set noswapfile
" Some LSPs have issues with backup file.
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" JSONC 
autocmd FileType json syntax match Comment +\/\/.\+$+

" Highlights search term as it is being written
set incsearch

set scrolloff=8
set signcolumn=yes

call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme gruvbox

let mapleader = " "
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, 
  },
}
EOF