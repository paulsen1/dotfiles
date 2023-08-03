local mapping = require("lachpaulsen.helpers.mappings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- LSP Things
    {
        "neovim/nvim-lspconfig",
        lazy=false,
        config = function()
            require("lachpaulsen.plugins.lsp")
        end,
        keys = mapping.mode_to_lazy(require("lachpaulsen.mappings.lsp")),
    },
    {
        "williamboman/mason.nvim",
        lazy=false,
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function ()
            require("mason").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
    },
}
local opts = {}

require("lazy").setup(plugins, opts)
