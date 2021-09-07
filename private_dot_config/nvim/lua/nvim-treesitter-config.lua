local treesitter  = require('nvim-treesitter.configs')

treesitter.setup { 
    ensure_installed = 'maintained',
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { enable = true },
}
