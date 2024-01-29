local M = {
	"declancm/maximize.nvim",
    lazy = true,
    keys = {
        { "<leader>m", "<cmd>lua require('maximize').toggle()<cr>" },
    }
}

return M
