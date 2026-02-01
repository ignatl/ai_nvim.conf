-- lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tanvirtin/monokai.nvim",           -- colorscheme
    { "mason-org/mason.nvim", opts = {} },
    require("plugins.blink"),
    require("plugins.which-key"),
    require("plugins.web-devicons"),
    require("plugins.mini-icons"),
    require("plugins.nvim-tree"),
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- load full config from separate file
            require("plugins.bufferline")  -- user/bufferline.lua
        end,
    },
    "famiu/bufdelete.nvim",
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
        "windwp/nvim-ts-autotag",
        config = function() require("nvim-ts-autotag").setup() end,
    },
    require("plugins.treesitter"),
    require("plugins.mini-pairs"),
    require("plugins.ts-autotag"),
    require("plugins.telescope"),
})

