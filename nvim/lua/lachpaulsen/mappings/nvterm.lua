-- Toggle floating terminal
vim.keymap.set("n", "<A-i>", function() require('nvterm.terminal').toggle("float") end, { noremap = true, silent = true })
vim.keymap.set("t", "<A-i>", function() require('nvterm.terminal').toggle("float") end, { noremap = true, silent = true })
-- Toggle horizontal terminal
vim.keymap.set("n", "<A-h>", function() require('nvterm.terminal').toggle("horizontal") end,
    { noremap = true, silent = true })
vim.keymap.set("t", "<A-h>", function() require('nvterm.terminal').toggle("horizontal") end,
    { noremap = true, silent = true })
-- Toggle vertical terminal
vim.keymap.set("n", "<A-v>", function() require('nvterm.terminal').toggle("vertical") end,
    { noremap = true, silent = true })
vim.keymap.set("t", "<A-v>", function() require('nvterm.terminal').toggle("vertical") end,
    { noremap = true, silent = true })
