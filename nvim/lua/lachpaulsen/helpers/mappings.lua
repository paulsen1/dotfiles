local M = {}
-- Used to convert a table grouped by vim mode into one recognised by lazy.nvim.
--
-- Takes a table that has each key as a vim mode and the value as a table of keymaps
-- The table of keymaps has the mapping as the key and a table containing the method
-- and description as the value. See example below
--
--@param mode_mappings { n = { 
--    ["gd"] = {
--        method = function()
--            print("Hello World")
--        end,
--        description = "Go to definition",
--    }
--}}
--@returns LazyKeys[]
M.mode_to_lazy = function (mode_mappings)
    local lazy_mappings = {}
    for mode, mappings in pairs(mode_mappings) do
        for mapping, method in pairs(mappings) do
            local keymap = { 
                mapping, 
                method.method, 
                { desc = method["description"], mode = mode } 
            }
            table.insert(lazy_mappings, keymap)
        end
    end
    return lazy_mappings
end

return M
