local ls = require("luasnip")

local function expandOrJumpNext()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end

local function jumpPrev()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end

local function nextChoiceNode()
    if ls.choice_active() then
        ls.change_choice()
    end
end

-- Expands the snippet OR jumps to the next node in the snippet
vim.keymap.set({ "i", "s" }, "<C-k>", function ()
    expandOrJumpNext()
end, { silent = true })

-- Jumps to the previous node in the snippet.
vim.keymap.set({ "i", "s" }, "<C-j>", function ()
    nextChoiceNode()
end, { silent = true })

-- Change the active choice in a choice node.
vim.keymap.set({ "i" }, "<C-l>", function ()
    jumpPrev()
end, { silent = true })

-- TODO: Below seems to not be good enough for luasnip. Ideally all of our keymaps would be written the same way.
--return {
--    i = {
--        ["<C-k>"] = {
--            method = function()
--                expandOrJumpNext()
--            end,
--            description = "Expand snippet or jump to next node.",
--        },
--        ["<C-j>"] = {
--            method = function()
--                jumpPrev()
--            end,
--            description = "Jump to previous node.",
--        },
--        ["<C-l>"] = {
--            method = function()
--                nextChoiceNode()
--            end,
--            description = "Select next choice in a list node.",
--        },
--    },
--    s = {
--        ["<C-k>"] = {
--            method = function()
--                expandOrJumpNext()
--            end,
--            description = "Expand snippet or jump to next node.",
--        },
--        ["<C-j>"] = {
--            method = function()
--                jumpPrev()
--            end,
--            description = "Jump to previous node.",
--        },
--    },
--}
