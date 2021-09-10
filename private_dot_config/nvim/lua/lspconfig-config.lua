local lspconfig = require('lspconfig')
DATA_PATH = vim.fn.stdpath "data"

lspconfig.sumneko_lua.setup {
    cmd = {
        DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
          "-E",
        DATA_PATH .. "/lspinstall/lua/main.lua",
    },
    settings = {
        Lua = {
            runtime = {
                -- LuaJIT in the case of Neovim
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        }
    },
}

