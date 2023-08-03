return {
    n = {
        -- Go to methods
        ["gd"] = {
            method = function()
                vim.lsp.buf.definition()
            end,
            description = "Go to definition.",
        },
        ["gD"] = {
            method = function()
                vim.lsp.buf.declaration()
            end,
            description = "Go to declaration.",
        },
        ["gi"] = {
            method = function()
                vim.lsp.buf.implementation()
            end,
            description = "Go to implementation.",
        },
        ["gr"] = {
            method = function()
                vim.lsp.buf.references()
            end,
            description = "Go to references.",
        },
        ["gtd"] = {
            method = function()
                vim.lsp.buf.type_definition()
            end,
            description = "Go to type definition.",
        },
        -- What this do? methods
        ["K"] = {
            method = function()
                vim.lsp.buf.hover()
            end,
            description = "Display help in a floating window.",
        },
        ["<leader>ls"] = {
            method = function()
                vim.lsp.buf.signature_help()
            end,
            description = "Display signature in a floating window.",
        },
        -- Refactor code methods
        ["<leader>ra"] = {
            method = function()
                vim.lsp.buf.rename()
            end,
            description = "Rename current variable.",
        },
        ["<leader>ca"] = {
            method = function()
                vim.lsp.buf.code_action()
            end,
            description = "Display LSP code actions",
        },
        ["<leader>fm"] = {
            method = function()
                vim.lsp.buf.format({ async = true })
            end,
            description = "Reformat file.",
        },
        -- Diagnostic methods
        -- TODO These are not good mappings
        ["<leader>f"] = {
            method = function()
                vim.diagnostic.open_float({ border = "rounded" })
            end,
            description = "Open diagnostic for current line.",
        },
        ["[d"] = {
            method = function()
                vim.diagnostic.goto_prev({ float = { border = "rounded" } })
            end,
            description = "Open diagnostic for current line.",
        },
        ["]d"] = {
            method = function()
                vim.diagnostic.goto_next({ float = { border = "rounded" } })
            end,
            description = "Open diagnostic for current line.",
        },
        ["<leader>q"] = {
            method = function()
                -- TODO: Close if open. Open if closed
                vim.diagnostic.setloclist()
            end,
            description = "Open diagnostic for current line.",
        },
    },
}
