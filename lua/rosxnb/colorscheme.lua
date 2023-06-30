-- local colorscheme = "kanagawa"
local colorscheme = "darkplus"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

local status, _ = pcall(function()
	vim.cmd("colorscheme " .. colorscheme)
end)

if not status then
	vim.notify("colorscheme:" .. colorscheme .. " not found. Setting 'slate' as fallback colorscheme")
	vim.cmd([[ colorscheme slate ]])
	return
end
