-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")
vim.keymap.del("n", "gcc")

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true }

        -- Keymaps for buffer navigation and closing
        local function add_doc(desc)
            return { noremap = true, silent = true, desc = desc }
        end

        keymap.set("n", "gr", lsp.buf.references, add_doc("Show References"))
        keymap.set("n", "gd", lsp.buf.definition, add_doc("Show Definition"))
        keymap.set("n", "<space>rn", lsp.buf.rename, add_doc("Rename Buffer"))
        keymap.set("n", "K", lsp.buf.hover, add_doc("Show Hover"))
        keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, add_doc("Format"))
        keymap.set(
            "n", "<leader>d", vim.diagnostic.open_float, add_doc("Show line diagnostics")
        )
    end
})

-- Python LSP initialisation
vim.lsp.config("ty", require("lsp.ty"))
vim.lsp.enable({ "ty" })

-- Ruff LSP initialisation
vim.lsp.config("ruff", require("lsp.ruff"))
vim.lsp.enable({ "ruff" })

