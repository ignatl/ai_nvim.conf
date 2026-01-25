local Utils = {}

-- Helper function to create keymap with description
function Utils.map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Helper function to create buffer-local keymap with description
function Utils.map_buf(mode, lhs, rhs, buf, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = buf, desc = desc })
end

return Utils
