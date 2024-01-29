local M = {
    "nvim-lualine/lualine.nvim",
}

function M.config()
    local icons = require "rosxnb.icons"

    require("lualine").setup {
        options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            ignore_focus = { "NvimTree" },
            disabled_filetypes = {
                statusline = { "dashboard", "alpha" }
            },
        },
        sections = {
            lualine_a = {},
            lualine_b = { "branch" },
            lualine_c = {
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.BoldError,
                        warn  = icons.diagnostics.BoldWarn,
                        info  = icons.diagnostics.BoldInfo,
                        hint  = icons.diagnostics.BoldHint,
                    },
                },
                { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                { "filename", path = 1, symbols = { modified = icons.ui.Circle, readonly = "", unnamed = "" } },
            },
            lualine_x = {
                "encoding",
                "fileformat",
                "filetype",
            },
            lualine_y = {
                { "progress", separator = " ", padding = { left = 1, right = 0 } },
                { "location", padding = { left = 0, right = 1 } },
            },
            lualine_z = {},
        },
        extensions = { "quickfix", "man", "fugitive" },
    }
end

return M
