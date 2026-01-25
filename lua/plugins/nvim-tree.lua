-- lua/configs/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

-- Helper function for attaching keymaps to nvim-tree buffer
local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local utils = require("utils")

    -- Tree navigation
    utils.map_buf("n", "l", api.node.open.edit, bufnr, "Open")
    utils.map_buf("n", "h", api.node.navigate.parent_close, bufnr, "Close")
    utils.map_buf("n", "v", api.node.open.vertical, bufnr, "Vertical split and Open")
    utils.map_buf("n", "s", api.node.open.horizontal, bufnr, "Horizontal split and Open")

    -- File operations
    utils.map_buf("n", "a", api.fs.create, bufnr, "Create")
    utils.map_buf("n", "d", api.fs.remove, bufnr, "Delete")
    utils.map_buf("n", "R", api.fs.rename, bufnr, "Rename")
    utils.map_buf("n", "y", api.fs.copy.node, bufnr, "Copy (Yank)")
    utils.map_buf("n", "x", api.fs.cut, bufnr, "Cut")
    utils.map_buf("n", "p", api.fs.paste, bufnr, "Paste")
    utils.map_buf("n", "r", api.tree.reload, bufnr, "Reload Tree")
    utils.map_buf("n", "q", api.tree.close, bufnr, "Close Tree")
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

-- Autoclose
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if
      #vim.api.nvim_list_wins() == 1
      and vim.bo.filetype == "NvimTree"
    then
      vim.cmd("quit")
    end
  end,
})

-- Leader key mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
vim.keymap.set("n", "<leader>n", function()
  require("nvim-tree.api").tree.find_file({
    open = true,
    focus = true,
  })
end, { desc = "Focus current file in NvimTree" })

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

