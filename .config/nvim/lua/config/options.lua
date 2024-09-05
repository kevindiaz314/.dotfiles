local opt = vim.opt 

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.relativenumber = true
opt.number = true

-- tabs 
opt.tabstop = 4         -- Number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 4      -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true    -- Convert tabs to spaces

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- use system clipboard as default register
opt.clipboard:append("unnamedplus")              
