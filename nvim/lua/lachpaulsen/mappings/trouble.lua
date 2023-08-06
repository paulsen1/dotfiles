return {
    n = {
        ["<leader>xx"] = {
            method = function()
                require('trouble').open()
            end,
            description = "Show diagnostic issues.",
        },
        ["<leader>xl"] = {
            method = function()
                require('trouble').next({ skip_groups = true, jump = true })
            end,
            description = "Go to next diagnostic issue.",
        },
        ["<leader>xh"] = {
            method = function()
                require('trouble').previous({ skip_groups = true, jump = true })
            end,
            description = "Go to prev diagnostic issue.",
        },
    },
}
