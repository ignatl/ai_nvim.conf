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
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true }

        -- Helper to create buffer-local keymap with description
        local function map(mode, lhs, rhs, desc)
            keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = buf, desc = desc })
        end

        map("n", "<space>a", lsp.buf.code_action, "Show code actions")
        map("n", "<space>i", lsp.buf.implementation, "Go to implementation")
        map("n", "<space>n", lsp.buf.rename, "Rename")
        map("n", "<space>r", lsp.buf.references, "Show references to symbol")
        map("n", "<space>t", lsp.buf.type_definition, "Go to type definition")
        map("n", "<space>d", lsp.buf.definition, "Go to definition")
        map("n", "<space>O", lsp.buf.document_symbol, "Document symbol")
        map("n", "<space>k", lsp.buf.hover, "Hover")
        map("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, "Format")
        map("n", "<space>l", vim.diagnostic.open_float, "Show line diagnostics")
    end
})

-- Python LSP initialisation
vim.lsp.config("ty", require("lsp.ty"))
vim.lsp.enable({ "ty" })

-- Ruff LSP initialisation
vim.lsp.config("ruff", require("lsp.ruff"))
vim.lsp.enable({ "ruff" })

