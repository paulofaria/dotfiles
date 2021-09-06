local telescope = require('telescope')
local actions = require('telescope.actions')

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

-- Setup
telescope.setup {
	defaults = {
        mappings = {
            i = {
                ["<C-h>"] = R("telescope").extensions.hop.hop,
                -- custom hop loop to multi selects and sending selected entries to quickfix list 
                ["<C-s>"] = function(prompt_bufnr)
                    local opts = {
                        callback = actions.toggle_selection,
                        loop_callback = actions.send_selected_to_qflist,
                    }

                    telescope.extensions.hop._hop_loop(prompt_bufnr, opts)
                end,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
	hop = {
            sign_hl = { "Title", "Title" },
            line_hl = { "CursorLine", "Normal" }, 
        },
    }
}

-- Load extensions
telescope.load_extension('fzy_native')
telescope.load_extension('gh')
telescope.load_extension('project')
telescope.load_extension('hop')

