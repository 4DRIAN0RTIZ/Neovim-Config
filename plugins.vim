call plug#begin('~/.config/nvim/autoload/plugged')
"Plug 'weirongxu/plantuml-previewer.vim'
"Plug 'tyru/open-browser.vim'
Plug 'jackMort/ChatGPT.nvim'
" Dependencias de ChatGPT.vim
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
"
Plug 'github/copilot.vim'
Plug 'leafOfTree/vim-matchtag'
"Temas
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'dracula/vim'
""LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
"Php
Plug 'StanAngeloff/php.vim'
"Color Picke
Plug 'KabbAmine/vCoolor.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim' , {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
"Emmet
Plug 'mattn/emmet-vim'
"Formatter
Plug 'mhartington/formatter.nvim'
"Syntax various languages
Plug 'sheerun/vim-polyglot'
"Additional for completion
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
"Add comments
Plug 'tpope/vim-commentary'
"Closetag
Plug 'alvan/vim-closetag'
"IdentLine
Plug 'Yggdroot/indentLine'
"Explorer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
						\ Plug 'ryanoasis/vim-devicons'
 Plug 'othree/html5.vim'
call plug#end()
