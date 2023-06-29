local function isempty(s)
	return s == nil or s == ""
end

local get_file_icon = function()
	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")

	if not isempty(filename) then
		local file_icon = require("nvim-web-devicons").get_icon(filename, extension, { default = true })

		if isempty(file_icon) then
			file_icon = ""
		end

		return file_icon
	end
end

local diagnostic_icons = {
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
}

return {
	-- lualine configuration
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			local navic_stat = {
				function()
					local loc = require("nvim-navic").get_location()
					if loc ~= "" then
						return "〉" .. loc
					end

					return loc
				end,
				cond = function()
					return require("nvim-navic").is_available()
				end,
				color = { bg = "NONE" },
			}

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
					-- component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = diagnostic_icons.error,
								warn = diagnostic_icons.warn,
								info = diagnostic_icons.info,
								hint = diagnostic_icons.hint,
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
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
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{ get_file_icon, padding = { left = 2, right = 1 } },
						{ "filename", path = 1, color = { bg = "NONE" } },
						navic_stat,
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				inactive_winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{ get_file_icon, padding = { left = 2, right = 1 } },
						{ "filename", path = 1, color = { bg = "NONE" } },
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = { "neo-tree", "lazy" },
			}
		end,
	},
	-- winbar file context provider
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			vim.g.navic_silence = true
			require("rosxnb.utils").on_attach(function(client, buffer)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, buffer)
				end
			end)
		end,
		opts = function()
			return {
				separator = "  ",
				highlight = true,
				depth_limit = 0,
				epth_limit_indicator = "..",
				icons = {
					File = " ",
					Module = " ",
					Namespace = " ",
					Package = " ",
					Class = " ",
					Method = " ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = " ",
					Interface = " ",
					Function = " ",
					Variable = " ",
					Constant = " ",
					String = " ",
					Number = " ",
					Boolean = " ",
					Array = " ",
					Object = " ",
					Key = " ",
					Null = " ",
					EnumMember = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
			}
		end,
	},
}
