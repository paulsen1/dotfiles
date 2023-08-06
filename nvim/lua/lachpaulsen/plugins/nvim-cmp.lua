local cmp = require('cmp')

local formatting_style = {
    -- default fields order i.e completion word + item.kind + item.kind icons
    fields = { "abbr", "kind", "menu" },
    format = function(_, item)
        local icons = {
            Namespace = "󰌗",
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰆧",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈚",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰊄",
            Table = "",
            Object = "󰅩",
            Tag = "",
            Array = "[]",
            Boolean = "",
            Number = "",
            Null = "󰟢",
            String = "󰉿",
            Calendar = "",
            Watch = "󰥔",
            Package = "",
            Copilot = "",
            Codeium = "",
            TabNine = "",
        }
        local icon = icons[item.kind] or ""

        icon = " " .. icon .. " "
        item.kind = string.format("%s %s", icon, item.kind or "")

        return item
    end,
}

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

cmp.setup({
    completion = {
        completeopt = "menu,menuone",
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = formatting_style,
    window = {
        completion = {
            side_padding = 1,
            scrollbar = false,
            border = border "CmpBorder",
        },
        documentation = {
            border = border "CmpDocBorder",
        },
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
    experimental = {
        ghost_text = true,
    },
})
