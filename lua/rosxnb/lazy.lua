-- automatically install Lazy if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })

  print("Installing 'Lazy: the plugin manager'. Reopen Neovim by quitting for changes to take effect")
end
vim.opt.rtp:prepend(lazypath)


local status, lazy = pcall(require, "lazy")
if not status then
  return
end


lazy.setup("plugins")
