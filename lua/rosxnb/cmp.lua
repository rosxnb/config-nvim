local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-emoji",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-buffer",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-path",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-cmdline",
            event = "InsertEnter",
        },
        {
            "saadparwaiz1/cmp_luasnip",
            event = "InsertEnter",
        },
        {
            "L3MON4D3/LuaSnip",
            event = "InsertEnter",
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
        },
        {
            "hrsh7th/cmp-nvim-lua",
        },
    },
}

function M.config()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    require("luasnip/loaders/from_vscode").lazy_load()

    local icons = require "rosxnb.icons"

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ["<C-k>"]       = cmp.mapping(  cmp.mapping.select_prev_item(),  { "i", "c" }  ),
            ["<C-j>"]       = cmp.mapping(  cmp.mapping.select_next_item(),  { "i", "c" }  ),
            ["<Down>"]      = cmp.mapping(  cmp.mapping.select_next_item(),  { "i", "c" }  ),
            ["<Up>"]        = cmp.mapping(  cmp.mapping.select_prev_item(),  { "i", "c" }  ),
            ["<C-b>"]       = cmp.mapping(  cmp.mapping.scroll_docs(-1),     { "i", "c" }  ),
            ["<C-f>"]       = cmp.mapping(  cmp.mapping.scroll_docs(1),      { "i", "c" }  ),
            ["<C-Space>"]   = cmp.mapping(  cmp.mapping.complete(),          { "i", "c" }  ),
            ["<C-e>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            -- ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                vim_item.kind = icons.kind[vim_item.kind]
                vim_item.menu = ({
                    nvim_lsp = "",
                    nvim_lua = "",
                    luasnip = "",
                    path = "",
                    emoji = "",
                    buffer = "",
                })[entry.source.name]

                if entry.source.name == "emoji" then
                    vim_item.kind = icons.misc.Smiley
                    vim_item.kind_hl_group = "CmpItemKindEmoji"
                end

                if entry.source.name == "cmp_tabnine" then
                    vim_item.kind = icons.misc.Robot
                    vim_item.kind_hl_group = "CmpItemKindTabnine"
                end

                return vim_item
            end,
        },
        sources = {
            { name = "copilot" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "cmp_tabnine" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "calc" },
            { name = "emoji" },
            { name = "buffer" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            completion = {
                border = "rounded",
                scrollbar = false,
            },
            documentation = {
                border = "rounded",
            },
        },
        experimental = {
            ghost_text = false,
        },
    }
end

return M
