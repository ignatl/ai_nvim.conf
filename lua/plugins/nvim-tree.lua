-- lua/configs/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

-- Helper function for attaching keymaps to nvim-tree buffer
local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Tree navigation
    vim.keymap.set("n", "l", api.node.open.edit, opts)
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
    vim.keymap.set("n", "v", api.node.open.vertical, opts)
    vim.keymap.set("n", "s", api.node.open.horizontal, opts)

    -- File operations
    vim.keymap.set("n", "a", api.fs.create, opts)
    vim.keymap.set("n", "d", api.fs.remove, opts)
    vim.keymap.set("n", "R", api.fs.rename, opts)
    vim.keymap.set("n", "y", api.fs.copy.node, opts)
    vim.keymap.set("n", "x", api.fs.cut, opts)
    vim.keymap.set("n", "p", api.fs.paste, opts)
    vim.keymap.set("n", "r", api.tree.reload, opts)
    vim.keymap.set("n", "q", api.tree.close, opts)
end

-- Main setup
nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        width = 30,
        side = "left",
        adaptive_size = true,
    },
    git = {
        enable = true,
        ignore = false,
    },
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = false,
        },
    },
    on_attach = on_attach, -- attach custom keymaps
})

-- Leader key mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- Which-key registration (new spec)
local wk_status, wk = pcall(require, "which-key")
if wk_status then
    wk.add({
        { "<leader>", group = "Explorer" },
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
        { "<leader>n", ":NvimTreeFindFile<CR>", desc = "Focus Current File" },
        { "<leader>r", ":NvimTreeRefresh<CR>", desc = "Refresh File Explorer" },
    })
end

