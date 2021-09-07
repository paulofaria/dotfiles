local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.mapleader = ' '

-- Map helper function

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Install packer, if not already installed

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

-- Plug Configuration
local packer = require('packer')

packer.startup(function()
    use 'wbthomason/packer.nvim'
    -- Config
    use 'alker0/chezmoi.vim'
    -- IDE
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use 'nvim-telescope/telescope-project.nvim' 
    use 'nvim-telescope/telescope-hop.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Editor
    use 'tpope/vim-sensible'
    use 'tpope/vim-commentary' 
    use 'tpope/vim-surround'
    use 'airblade/vim-gitgutter'
    use 'phaazon/hop.nvim'

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 1
                }
            }
        end
    }

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup()
        end
    }

    -- Themes 
    use 'folke/tokyonight.nvim'
    use 'kyazdani42/nvim-web-devicons'

end)

cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerCompile
    augroup end
]])



-- IDE
require('lsp-config')
--set completeopt=menuone,noinsert,noselect
--let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
--lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
require('telescope-config')
require('lualine-config')
require('nvim-treesitter-config')

map('n', '<leader>ff', '<cmd>Telescope git_files<cr>') -- Find files with Telescope
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- Find buffers with Telescope

-- Editor

opt.scrolloff = 10 -- Show at least 10 lines below/above cursor
opt.number = true -- Show line number
opt.relativenumber = true -- Relative line numbers
opt.tabstop = 4 -- Tabs with 4 spaces width
opt.shiftwidth = 4 -- When indenting with '>', use 4 spaces width
opt.expandtab = true -- On pressing tab, insert 4 spaces

g.gitgutter_map_keys = 0 -- Disable gitgutter mappings because they were conflicting with hop

map('i', 'jk', '<esc>') 
map('n', '<leader>hw', '<cmd>HopWord<cr>') -- Hop to word
map('n', '<leader>hc', '<cmd>HopChar1<cr>') -- Hop to character
map('n', '<leader>hb', '<cmd>HopChar2<cr>') -- Hop to bigram (2 characters)
map('n', '<leader>hp', '<cmd>HopPattern<cr>') --nnoremap <leader>hp <cmd>HopPattern<cr>

-- Theme
require('nvim-web-devicons-config')

opt.termguicolors = true
cmd 'colorscheme tokyonight'
