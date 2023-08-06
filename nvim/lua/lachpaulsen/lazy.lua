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
    -- Include plenary for plugin development.
    'nvim-lua/plenary.nvim',
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        config = function()
            vim.cmd [[colorscheme catppuccin-mocha]]
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "NornmalSB", { bg = "none" })
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
    -- Autocomplete config snippets and autopairing
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
        config = function()
            require("fidget").setup()
        end
    },
    -- Configure telescope to search the codebases
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        keys = mapping.mode_to_lazy(require("lachpaulsen.mappings.telescope")),
        opts = function()
            return require("lachpaulsen.plugins.telescope")
        end,
        config = function(_, opts)
            require('telescope').setup(opts)
        end
    },
    {
        'stevearc/dressing.nvim',
        event = "BufReadPre",
        lazy = false,
        config = function()
            require('dressing').setup({
                input = { relative = "editor" },
                select = {
                    backend = { "telescope", "fzf", "builtin" },
                },
            })
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            {
                "nvim-tree/nvim-web-devicons",
            },
        },
        keys = mapping.mode_to_lazy(require("lachpaulsen.mappings.nvim-tree")),
        config = function()
            require("lachpaulsen.plugins.nvim-tree")
        end
    },
    {
        "akinsho/toggleterm.nvim",
        keys = mapping.mode_to_lazy(require("lachpaulsen.mappings.toggleterm")),
        config = function()
            require('lachpaulsen.plugins.toggleterm')
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require('lachpaulsen.plugins.gitsigns')
        end,
        lazy = false,
        keys = mapping.mode_to_lazy(require("lachpaulsen.mappings.gitsigns")),
        config = function(_, opts)
            require("gitsigns").setup(opts)
        end
    },
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n",          desc = "Comment toggle current line" },
            { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n",          desc = "Comment toggle current block" },
            { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
        },
        config = function()
            require('Comment').setup()
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = mapping.mode_to_lazy(require("lachpaulsen.mappings.trouble")),
        config = function ()
            require('trouble').setup({})
        end
    },
}
local opts = {}

require("lazy").setup(plugins, opts)
