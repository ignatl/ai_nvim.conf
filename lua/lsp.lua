-- -- Remove Global Default Key mapping
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "gO")
vim.keymap.del("n", "gcc")

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local buffer = args.buf
        local buf = vim.lsp.buf
        local utils = require("utils")

        utils.map_buf("n", "<leader>a", buf.code_action, buffer, "Show code actions")
        utils.map_buf("n", "<leader>i", buf.implementation, buffer, "Go to implementation")
        utils.map_buf("n", "<leader>n", buf.rename, buffer, "Rename")
        utils.map_buf("n", "<leader>r", buf.references, buffer, "Show references to symbol")
        utils.map_buf("n", "<leader>t", buf.type_definition, buffer, "Go to type definition")
        utils.map_buf("n", "<leader>d", buf.definition, buffer, "Go to definition")
        utils.map_buf("n", "<leader>O", buf.document_symbol, buffer, "List symbols")
        utils.map_buf("n", "<leader>k", buf.hover, buffer, "Hover")
        utils.map_buf("n", "<leader>f", function()
            vim.buf.format({ async = true })
        end, buffer, "Format")
        utils.map_buf("n", "<leader>l", vim.diagnostic.open_float, buffer, "Show line diagnostics")
    end
})

-- Python LSP initialisation
vim.lsp.config("ty", require("lsp.ty"))
vim.lsp.enable({ "ty" })

-- Ruff LSP initialisation
vim.lsp.config("ruff", require("lsp.ruff"))
vim.lsp.enable({ "ruff" })

