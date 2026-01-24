---@type vim.lsp.Config
return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'ruff.toml', 'pyproject.toml', '.git' },
    init_options = {
        settings = {
            -- You can add server settings here if needed
            -- e.g., showSyntaxErrors = false
        },
    },
}
