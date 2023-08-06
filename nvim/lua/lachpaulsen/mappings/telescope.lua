local telescope = require('telescope.builtin')

return {
    n = {
        ["<leader>ff"] = {
            method = function()
                telescope.find_files({ hidden = true })
            end,
            description = "Find file by name.",
        },
        ["<leader>fw"] = {
            method = function()
                telescope.live_grep({ hidden = true })
            end,
            description = "Find by word in files.",
        },
        ["<leader>wf"] = {
            method = function()
                vim.ui.input({ prompt = "Search For" },
                function(input_string)
                    if (input_string == '') then
                        return
                    end
                    telescope.grep_string({
                        search = input_string,
                    })
                end)
            end,
            description = "Find word in files by name.",
        },
    },
}
