return {
    n = {
        ["<leader>gg"] = {
            method = function()
                local Terminal = require('toggleterm.terminal').Terminal
                local lazygit = Terminal:new({
                    cmd = "lazygit",
                    hidden = true,
                    close_on_exit = true,
                    direction = 'float',
                })
                lazygit:toggle()
            end,
            description = "Load lazygit in a floating terminal window.",
        },
    },
}
