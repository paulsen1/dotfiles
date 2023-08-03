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
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function ()
            vim.cmd [[colorscheme catppuccin-mocha]]
        end
    },
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
    {
        "NvChad/nvterm",
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
    },
    {
        "numToStr/Comment.nvim",
    },
    {
        "nvim-tree/nvim-tree.lua",
    },
    {
        "nvim-telescope/telescope.nvim",
    },
}
local opts = {}

require("lazy").setup(plugins, opts)
