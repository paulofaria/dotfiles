" Key mappings
inoremap jk <Esc>

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

" show at least 10 lines below/above cursor
set scrolloff=10

" relative line numbers
set number
set relativenumber 

" search down into subfolders
" provides tab-completion for all file-related tasks
set path +=**

" theme options

if has('termguicolors')
    set termguicolors
endif

set background=dark

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
Plug 'vim-airline/vim-airline'
" Editor
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
" Themes
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

" theme configuration
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_diagnostic_virtual_text = 'colored'
let g:airline_theme = 'sonokai'
colorscheme sonokai

" IDE
let mapleader = " "

" Find files with Telescope
nnoremap <leader>ff <cmd>Telescope git_files<cr>

" Find buffers with Telescope
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" LSP Config
lua require("lsp-config")

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

" Telescope Config
lua require("telescope-config")
