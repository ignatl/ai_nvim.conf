-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}  -- ???
vim.opt.mouse = 'a'                 -- allow mouse to be used in nvim

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spaces for TAB replacement
vim.opt.shiftwidth = 4              -- number of spaces for autoindent
vim.opt.expandtab = true            -- converts tabs into spaces when typing

-- UI config
vim.opt.number = true               -- show line number
vim.opt.relativenumber = true       -- switch to relative number
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal split right
-- vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true             -- highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if uppercase is entered

-- Scrolling
vim.opt.scrolloff = 7               -- Number of lines to keep below and above the cursor

