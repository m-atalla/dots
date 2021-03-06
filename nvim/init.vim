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

" Rust Analyzer
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
" Highlights search term as it is being written
set incsearch

set scrolloff=8
set signcolumn=yes

" use term colors
set termguicolors

call plug#begin('~/.vim/plugged')
    " Colorscheme
    Plug 'gruvbox-community/gruvbox'

    " Telescope junk
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " LS, syntax highlighting
    Plug 'neovim/nvim-lspconfig'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Status line
    Plug 'nvim-lualine/lualine.nvim'

    Plug 'lukas-reineke/indent-blankline.nvim'

    " Neogit (nvim magit clone)
    Plug 'TimUntersberger/neogit'

    " " Additional gruvbox theme... disabled.
    " Plug 'sainnhe/gruvbox-material'
call plug#end()

" Colorscheme
colorscheme gruvbox

let mapleader = " "
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Neogit 
nnoremap <leader>gg <cmd>Neogit<cr>
nnoremap <leader>gl <cmd>Neogit log<cr>


lua <<EOF
local neogit = require('neogit')

neogit.setup {
    disable_commit_confirmation = true,
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, 
  },
  indent = {
      enable = true
  }
}

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<A-v>'] = actions.select_vertical,
                ['A-h'] = actions.select_horizontal,
            }
        },
        file_ignore_patterns = {
            "node_modules",
            "target"
        }
    }
}

require('lualine').setup {
    options = { theme = 'gruvbox_dark' },
    sections = {
        lualine_x = {'filetype'}
    }
}
EOF
