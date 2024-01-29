local M = {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "VeryLazy",
        },
    },
}

function M.config()
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap( "n",  "<leader>,",  "<Plug>(comment_toggle_linewise_current)",  opts  )
    keymap( "v",  "<leader>,",  "<Plug>(comment_toggle_linewise_visual)",   opts  )

    vim.g.skip_ts_context_commentstring_module = true

    require("ts_context_commentstring").setup {
        enable_autocmd = false,
    }

    require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
end

return M
