return {
    n = {
        ["<leader>gb"] = {
            method = function()
                package.loaded.gitsigns.blame_line()
            end,
            description = "Find file by name.",
        },
    },
}
