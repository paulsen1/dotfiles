return {
    n = {
        ["<leader>fh"] = {
            method = function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            description = "Open Harpoon window",
        },
        ["<leader>a"] = {
            method = function()
                require("harpoon.mark").add_file()
            end,
            description = "Open Harpoon window",
        },
        ["<leader>fn"] = {
            method = function()
                require("harpoon.mark").nav_next()
            end,
            description = "Open Harpoon window",
        },
        ["<leader>fb"] = {
            method = function()
                require("harpoon.mark").nav_prev()
            end,
            description = "Open Harpoon window",
        },
    },
}
