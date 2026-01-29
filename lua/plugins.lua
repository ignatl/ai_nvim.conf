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
    {
        "saghen/blink.cmp",
        -- snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = function() require("plugins.blink") end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
    {
        "echasnovski/mini.icons",
        version = false, -- olways use the latest
        lazy = true
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("plugins.nvim-tree") end
    },
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

