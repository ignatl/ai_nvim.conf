---@type vim.lsp.Config
return {
    cmd = { 'ruff-lsp', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'ruff.toml', 'pyproject.toml', '.git' },
    init_options = {
        settings = {
            -- You can add server settings here if needed
            -- e.g., showSyntaxErrors = false
        },
    },
}

