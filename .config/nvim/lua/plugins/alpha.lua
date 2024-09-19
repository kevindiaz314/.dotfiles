return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        
        -- Set header
        local logo = [[
               ]]

        dashboard.section.header.val = {
          "                                                   ",
          "  ██╗  ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          "  ██║ ██╔╝██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          "  █████╔╝ █████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          "  ██╔═██╗ ██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          "  ██║  ██╗███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          "  ╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
            dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
            dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
        }
        -- Send config to alpha
        require("alpha").setup(dashboard.opts)
    end,
}
