-- General

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
vim.opt.timeoutlen = 1000

-- Key Mappings

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- Save with ctrl+s

-- Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
-- lvim.keys.normal_mode["<C-j>"]
-- nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
-- nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

-- Telescope

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.

lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- Input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- Normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

-- Which Key

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- lvim.builtin.which_key.mappings["ls"] = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" }

-- Dashboard

lvim.builtin.dashboard.active = true

-- Terminal

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"

-- Lua line

local components = require("core.lualine.components")

lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.component_separators = ''
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = {}

lvim.builtin.lualine.sections.lualine_c = {
  components.branch,
  components.filename,
  components.diff,
  components.diagnostics
}

lvim.builtin.lualine.sections.lualine_x = {
  components.filetype,
  components.progress
}

lvim.builtin.lualine.sections.lualine_y = {}
lvim.builtin.lualine.sections.lualine_z = { components.scrollbar }

-- Nvim Tree

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- Tree Sitter

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Comments based on the cursor location in the file

lvim.builtin.treesitter.context_commentstring = {
  enable = true,
  enable_autocmd = false
}

lvim.builtin.comment.hook = function()
  require("ts_context_commentstring.internal").update_commentstring()
end

-- Adds Tabnine as the first source for cmp's autocomplete

table.insert(lvim.builtin.cmp.sources, 1, { name = "cmp_tabnine" })

-- Formatters and Linters

lvim.lang.javascript.formatters = { { exe = "prettier" } }
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters

lvim.lang.javascript.linters = { { exe = "eslint" } }
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters

lvim.lang.typescript.formatters = { { exe = "prettier" } }
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters

lvim.lang.typescript.linters = { { exe = "eslint" } }
lvim.lang.typescriptreact.linters = lvim.lang.typescript.linters

-- Plugins

lvim.plugins = {
  { "folke/tokyonight.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup()
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 1
        }
      }
    end
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  { "tpope/vim-repeat" },
  {
    "tpope/vim-surround",
    keys = {"c", "d", "y"}
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup()
    end
  },
  {
    "tzachar/cmp-tabnine",
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  },
  {
    "monaqa/dial.nvim",
      event = "BufRead",
      config = function()
        local dial = require("dial")

        vim.cmd([[
          nmap <C-a> <Plug>(dial-increment)
          nmap <C-x> <Plug>(dial-decrement)
          vmap <C-a> <Plug>(dial-increment)
          vmap <C-x> <Plug>(dial-decrement)
          vmap g<C-a> <Plug>(dial-increment-additional)
          vmap g<C-x> <Plug>(dial-decrement-additional)
        ]])

        dial.augends["custom#boolean"] = dial.common.enum_cyclic {
          name = "boolean",
          strlist = { "true", "false" },
        }

        table.insert(dial.config.searchlist.normal, "custom#boolean")

        -- For Languages which prefer True/False, e.g. python.

        dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
          name = "Boolean",
          strlist = { "True", "False" },
        }

        table.insert(dial.config.searchlist.normal, "custom#Boolean")
      end,
  },
  {
    "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "*" }, {
            RGB = true, -- #RGB hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            RRGGBBAA = true, -- #RRGGBBAA hex codes
            rgb_fn = true, -- CSS rgb() and rgba() functions
            hsl_fn = true, -- CSS hsl() and hsla() functions
            css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
    end,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)

lvim.autocommands.custom_groups = {
  { "InsertEnter", "*", ":normal zz" }, -- Center cursor on entering insert mode
}
