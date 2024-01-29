local M = {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.api.nvim_set_hl(  0,  "NormalFloat",  { bg = "none" }  )
    vim.api.nvim_set_hl(  0,  "Normal",       { bg = "none" }  )
    vim.api.nvim_set_hl(  0,  "NormalNC",     { bg = "none" }  )
    vim.api.nvim_set_hl(  0,  "NonText",      { bg = "none" }  )
    vim.api.nvim_set_hl(  0,  "SignColumn",   { bg = "none" }  )

    require("kanagawa").setup {
        transparent = true,          -- do not set background color
        dimInactive = false,          -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
            theme = {
                all = {
                    ui = { bg_gutter = "none" }
                }
            },
        },
    }

    vim.cmd.colorscheme "kanagawa"
end

return M
