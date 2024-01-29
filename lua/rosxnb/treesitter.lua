local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
}

function M.config()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            "bash",
            "html",
            "c",
            "cpp",
            "javascript",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
            "java",
        },
        highlight = {
            enable = true
        },
    }
end

return M
