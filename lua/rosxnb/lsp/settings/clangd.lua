local navic = require("nvim-navic")

return {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
