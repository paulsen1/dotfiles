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
        lazy = false,
        config = function()
            vim.cmd [[colorscheme catppuccin-mocha]]
        end
    },
    -- LSP Things
    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufWinEnter", "BufNewFile" },
        config = function()
            require("lachpaulsen.plugins.lsp")
        end,
        keys = mapping.mode_to_lazy(require("lachpaulsen.mappings.lsp")),
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup()
                end
            },
        },
        config = function()
            require("mason").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                config = function()
                    require('lachpaulsen.plugins.luasnip')
                    require('lachpaulsen.mappings.luasnip')
                end,
            },
            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        config = function()
            require("lachpaulsen.plugins.nvim-cmp")
        end,
    },
    -- Display LSP info while it is loading.
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        config = function ()
            require("fidget").setup()
        end
    },
    {
        "NvChad/nvterm",
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-treesitter/nvim-treesitter",
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
