local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({})
lspconfig.tsserver.setup({})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
