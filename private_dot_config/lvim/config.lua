-- General

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
vim.opt.timeoutlen = 1000

-- Key Mappings

lvim.leader = "space"

-- Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
-- lvim.keys.normal_mode["<C-j>"]
-- nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
-- nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

-- which_key

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

-- dashboard

lvim.builtin.dashboard.active = true

-- notify

lvim.builtin.notify.active = true

-- terminal

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"

-- nvimtree

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- lualine

local components = require("lvim.core.lualine.components")

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

-- treesitter

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- cmp

table.insert(lvim.builtin.cmp.sources, 1, { name = "cmp_tabnine" })

-- lsp

local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup {
  {
    command = "prettier",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
  },
}

local linters = require("lvim.lsp.null-ls.linters")

linters.setup {
  {
    command = "eslint",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
  },
}

-- Additional Plugins
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
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup()
    end
  },
  {
    "tzachar/cmp-tabnine",
    run ='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      vim.cmd([[
        nmap  <C-a>  <Plug>(dial-increment)
        nmap  <C-x>  <Plug>(dial-decrement)
        vmap  <C-a>  <Plug>(dial-increment)
        vmap  <C-x>  <Plug>(dial-decrement)
        vmap g<C-a> g<Plug>(dial-increment)
        vmap g<C-x> g<Plug>(dial-decrement)
      ]])

      local augend = require("dial.augend")

      require("dial.config").augends:register_group{
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
        },
        typescript = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.constant.new {
            elements = {
              "let",
              "const",
            },
          }
        },
        visual = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
        }
      }
    end
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
    end
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)

lvim.autocommands.custom_groups = {
 { "InsertEnter", "*", ":normal zz" }, -- Center cursor on entering insert mode
}

