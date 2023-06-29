local function is_modified_buffer_open(buffers)
	for _, v in pairs(buffers) do
		if v.name:match("NvimTree_") == nil then
			return true
		end
	end
	return false
end

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if
			#vim.api.nvim_list_wins() == 1
			and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
			and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
		then
			vim.cmd("quit")
		end
	end,
})

return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer NeoTree (root dir)", remap = true },
	},
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		renderer = {
			root_folder_modifier = ":t",
			root_folder_label = ":~:s?$?/..?",
			indent_width = 2,
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						untracked = "U",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		view = {
			adaptive_size = true,
			side = "left",
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))

			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))

			vim.keymap.set("n", "\\", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "-", api.node.open.horizontal, opts("Open: Horizontal Split"))
		end,
	},
}
