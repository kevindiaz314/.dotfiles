return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        presets = {
            bottom_search = true, -- Use a classic bottom cmdline for search
        },
    },
    dependencies = { 
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
