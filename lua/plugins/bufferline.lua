-- Full configuration for bufferline.nvim

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        numbers = "ordinal",             -- Show buffer number
        close_command = "bdelete! %d",   -- Command to close buffer
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,      -- Disable middle click
        indicator = { style = "underline" },
        buffer_close_icon = "❌",
        modified_icon = "🦖",
        close_icon = "❌",
        left_trunc_marker = "👈",
        right_trunc_marker = "👉",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer name is duplicate
        tab_size = 18,
        diagnostics = "nvim_lsp",       -- Show LSP diagnostics
        diagnostics_update_in_insert = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,     -- Keeps custom sorting when buffers are reloaded
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
    },
})

-- Keymaps for buffer navigation and closing
local opts = { noremap = true, silent = true }
local function add_doc(desc)
    return { noremap = true, silent = true, buffer = bufnr , desc = desc}
end

-- Switch to next/previous buffer
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', add_doc("Next Tab"))
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', add_doc("Previous Tab"))

-- Close current buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':Bdelete<CR>', add_doc("Close Tab"))

