-- lua/configs/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

-- Helper function for adding keymap description to the table
local function add_doc(opts, desc)
    return vim.tbl_extend("error", opts, { desc = desc })
end


-- Helper function for attaching keymaps to nvim-tree buffer
local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Tree navigation
    vim.keymap.set("n", "l", api.node.open.edit, add_doc(opts, "Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, add_doc(opts, "Close"))
    vim.keymap.set("n", "v", api.node.open.vertical, add_doc(opts, "Vertical split and Open"))
    vim.keymap.set("n", "s", api.node.open.horizontal, add_doc(opts, "Horizontal split and Open"))

    -- File operations
    vim.keymap.set("n", "a", api.fs.create, add_doc(opts, "Create"))
    vim.keymap.set("n", "d", api.fs.remove, add_doc(opts, "Delete"))
    vim.keymap.set("n", "R", api.fs.rename, add_doc(opts, "Rename"))
    vim.keymap.set("n", "y", api.fs.copy.node, add_doc(opts, "Copy (Yank)"))
    vim.keymap.set("n", "x", api.fs.cut, add_doc(opts, "Cut"))
    vim.keymap.set("n", "p", api.fs.paste, add_doc(opts, "Paste"))
    vim.keymap.set("n", "r", api.tree.reload, add_doc(opts, "Reload Tree"))
    vim.keymap.set("n", "q", api.tree.close, add_doc(opts, "Close Tree"))
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

