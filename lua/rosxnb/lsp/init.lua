local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "rosxnb.lsp.mason"
require("rosxnb.lsp.handlers").setup()
require "rosxnb.lsp.null-ls"
