return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
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
        local function get_modified_buffers()
            local modified = {}
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_is_loaded(buf)
                   and vim.bo[buf].modified
                   and vim.bo[buf].buflisted -- игнорим временные буферы
                then
                    table.insert(modified, vim.api.nvim_buf_get_name(buf))
                end
            end
            return modified
        end

        -- BufEnter autocmd for safe NvimTree autoclose
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
                    local modified = get_modified_buffers()
                    if #modified > 0 then
                        local bufs = vim.api.nvim_list_bufs()
                        for _, buf in ipairs(bufs) do
                            if vim.api.nvim_buf_is_loaded(buf)
                               and vim.bo[buf].buflisted
                               and vim.bo[buf].filetype ~= "NvimTree"
                            then
                                vim.api.nvim_set_current_buf(buf)
                                break
                            end
                        end
                        print("⚠ Unsaved buffers, cannot quit: " .. table.concat(modified, ", "))
                    else
                        vim.cmd("quit") -- безопасно, можно закрывать
                    end
                end
            end,
        })

        -- Leader key mappings
        local utils = require("utils")
        utils.map("n", "<leader>e", ":NvimTreeToggle<CR>", "Toggle File Explorer")
        utils.map("n", "<leader>r", ":NvimTreeRefresh<CR>", "Refresh File Explorer")
        utils.map("n", "<leader>n", function()
          require("nvim-tree.api").tree.find_file({
            open = true,
            focus = true,
          })
        end, "Focus Current File")
    end
}

