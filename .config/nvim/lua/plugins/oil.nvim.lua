return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
                natural_order = true,
                is_always_hidden = function(name,_)
                    return name == '..'
                end,
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
        })
        
        -- Open parent directory in curren window
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        -- Open parent directory in floating window
        vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    end,
}
