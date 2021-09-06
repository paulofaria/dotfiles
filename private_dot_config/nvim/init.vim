" Basic key mappings
inoremap jk <Esc>
let mapleader = " "

"nnoremap <Left> :echo "No left for you!"<CR>
"vnoremap <Left> :<C-u>echo "No left for you!"<CR>
"inoremap <Left> <C-o>:echo "No left for you!"<CR>

"nnoremap <Right> :echo "No right for you!"<CR>
"vnoremap <Right> :<C-u>echo "No right for you!"<CR>
"inoremap <Right> <C-o>:echo "No right for you!"<CR>

"nnoremap <Up> :echo "No up for you!"<CR>
"vnoremap <Up> :<C-u>echo "No up for you!"<CR>
"inoremap <Up> <C-o>:echo "No up for you!"<CR>

"nnoremap <Down> :echo "No down for you!"<CR>
"vnoremap <Down> :<C-u>echo "No down for you!"<CR>
"inoremap <Down> <C-o>:echo "No down for you!"<CR>

" Plug Configuration
call plug#begin('~/.vim/plugged')

" Config
Plug 'alker0/chezmoi.vim'
" LSP 
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" IDE
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-project.nvim' 
Plug 'nvim-telescope/telescope-hop.nvim'
Plug 'vim-airline/vim-airline'
" Editor
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'phaazon/hop.nvim'
" Themes
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" LSP
lua require("lsp-config")

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

" IDE
lua require("telescope-config")

" Find files with Telescope
nnoremap <leader>ff <cmd>Telescope git_files<cr>

" Find buffers with Telescope
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" Editor

" Show at least 10 lines below/above cursor
set scrolloff=10

" Relative line numbers
set number
set relativenumber 

" Disable gitgutter mappings
let g:gitgutter_map_keys = 0

" Hop to word
nnoremap <leader>hw <cmd>HopWord<cr>

" Hop to character
nnoremap <leader>hc <cmd>HopChar1<cr>

" Hop to bigram (2 characters)
nnoremap <leader>hb <cmd>HopChar2<cr>

" Hop to pattern
nnoremap <leader>hp <cmd>HopPattern<cr>

" Show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Theme
lua require("nvim-web-devicons-config")

if has('termguicolors')
    set termguicolors
endif

set background=dark

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_diagnostic_virtual_text = 'colored'
let g:airline_theme = 'sonokai'
colorscheme sonokai
