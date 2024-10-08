return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "gmake" },
		"nvim-tree/nvim-web-devicons",
	},
    opts = {
        defaults = {
            -- Default Telescope settings
            file_ignore_patterns = { ".git/" },  -- Ignore .git files
            mappings = {
                i = {
                    -- Remap Ctrl+j and Ctrl+k for moving selection up/down in insert mode
                    ["<C-j>"] = require('telescope.actions').move_selection_next,
                    ["<C-k>"] = require('telescope.actions').move_selection_previous,
                },
            },
        },
        pickers = {
            find_files = {
                hidden = true,  -- Show hidden files
            }
        },
        extensions = {
            file_browser = {
                hidden = true,
            },
        },
    },
	config = function(_, opts)
        -- Use opts to set up telescope
        require('telescope').setup(opts)

		-- To get fzf loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require("telescope").load_extension("fzf")

		require("telescope").load_extension("file_browser")
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Lists files in your cwd" } },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Search for a string in your cwd" } },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Lists open buffers in current Neovim instance" } },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Searches for the string under your cursor" } },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Lists previously open files" } },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy search through the output of git ls-files" } },
		{ "<leader>fe", "<cmd>Telescope file_browser<cr>", { desc = "" } },
	},
}
