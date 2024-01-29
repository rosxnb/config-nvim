local M = {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
}

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

function M.config()
    vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

    local icons = require "rosxnb.icons"

    require("nvim-tree").setup {
        hijack_netrw = false,
        sync_root_with_cwd = true,
        view = {
            relativenumber = true,
            number = true,
            width = {
                padding = 4,
            }
        },
        renderer = {
            add_trailing = false,
            group_empty = false,
            highlight_git = false,
            full_name = false,
            highlight_opened_files = "none",
            root_folder_label = ":t",
            indent_width = 2,
            indent_markers = {
                enable = false,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    none = " ",
                },
            },
            icons = {
                git_placement = "before",
                padding = " ",
                symlink_arrow = " ➛ ",
                glyphs = {
                    default = icons.ui.Text,
                    symlink = icons.ui.FileSymlink,
                    bookmark = icons.ui.BookMark,
                    folder = {
                        arrow_closed = icons.ui.ChevronRight,
                        arrow_open = icons.ui.ChevronShortDown,
                        default = icons.ui.Folder,
                        open = icons.ui.FolderOpen,
                        empty = icons.ui.EmptyFolder,
                        empty_open = icons.ui.EmptyFolderOpen,
                        symlink = icons.ui.FolderSymlink,
                        symlink_open = icons.ui.FolderOpen,
                    },
                    git = {
                        unstaged = icons.git.FileUnstaged,
                        staged = icons.git.FileStaged,
                        unmerged = icons.git.FileUnmerged,
                        renamed = icons.git.FileRenamed,
                        untracked = icons.git.FileUntracked,
                        deleted = icons.git.FileDeleted,
                        ignored = icons.git.FileIgnored,
                    },
                },
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "LICENSE", "CMakeLists.txt" },
            symlink_destination = true,
        },
        update_focused_file = {
            enable = true,
            debounce_delay = 15,
            update_root = true,
            ignore_list = {},
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            show_on_open_dirs = true,
            debounce_delay = 50,
            severity = {
                min = vim.diagnostic.severity.HINT,
                max = vim.diagnostic.severity.ERROR,
            },
            icons = {
                hint = icons.diagnostics.BoldHint,
                info = icons.diagnostics.BoldInformation,
                warning = icons.diagnostics.BoldWarning,
                error = icons.diagnostics.BoldError,
            },
        },
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
            local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
            local keymap = vim.keymap.set

			keymap(  "n",  "<BS>",  api.node.navigate.parent_close,      opts  )
			keymap(  "n",  "h",     api.node.navigate.parent_close,      opts  )
			keymap(  "n",  "<CR>",  api.node.open.edit,                  opts  )
			keymap(  "n",  "l",     api.node.open.edit,                  opts  )
			keymap(  "n",  "\\",    api.node.open.vertical,              opts  )
			keymap(  "n",  "-",     api.node.open.horizontal,            opts  )
			keymap(  "n",  "<C-r>", api.fs.rename_sub,                   opts  )
			keymap(  "n",  ">",     api.node.navigate.sibling.next,      opts  )
			keymap(  "n",  "<",     api.node.navigate.sibling.prev,      opts  )
			keymap(  "n",  "a",     api.fs.create,                       opts  )
			keymap(  "n",  "d",     api.fs.remove,                       opts  )
			keymap(  "n",  "D",     api.fs.trash,                        opts  )
			keymap(  "n",  "E",     api.tree.expand_all,                 opts  )
			keymap(  "n",  "e",     api.fs.rename_basename,              opts  )
			keymap(  "n",  "]e",    api.node.navigate.diagnostics.next,  opts  )
			keymap(  "n",  "[e",    api.node.navigate.diagnostics.prev,  opts  )
			keymap(  "n",  "F",     api.live_filter.clear,               opts  )
			keymap(  "n",  "f",     api.live_filter.start,               opts  )
			keymap(  "n",  "gy",    api.fs.copy.absolute_path,           opts  )
			keymap(  "n",  "H",     api.tree.toggle_hidden_filter,       opts  )
			keymap(  "n",  "I",     api.tree.toggle_gitignore_filter,    opts  )
			keymap(  "n",  "J",     api.node.navigate.sibling.last,      opts  )
			keymap(  "n",  "K",     api.node.navigate.sibling.first,     opts  )
			keymap(  "n",  "o",     api.node.open.edit,                  opts  )
			keymap(  "n",  "O",     api.node.open.no_window_picker,      opts  )
			keymap(  "n",  "p",     api.fs.paste,                        opts  )
			keymap(  "n",  "P",     api.node.navigate.parent,            opts  )
			keymap(  "n",  "q",     api.tree.close,                      opts  )
			keymap(  "n",  "r",     api.fs.rename,                       opts  )
			keymap(  "n",  "R",     api.tree.reload,                     opts  )
			keymap(  "n",  "W",     api.tree.collapse_all,               opts  )
			keymap(  "n",  "x",     api.fs.cut,                          opts  )
			keymap(  "n",  "y",     api.fs.copy.filename,                opts  )
			keymap(  "n",  "Y",     api.fs.copy.relative_path,           opts  )
		end,
    }
end

return M
