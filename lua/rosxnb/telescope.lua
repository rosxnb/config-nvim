local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        "nvim-lua/plenary.nvim",
    },
}

function M.config()
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap(  "n",  "<leader><leader>",  "<cmd>Telescope git_files<cr>",                                      opts  )
    keymap(  "n",  "<leader>/",         "<cmd>Telescope live_grep<cr>",                                      opts  )
    keymap(  "n",  "<leader>.",         "<cmd>Telescope planets<cr>",                                        opts  )
    keymap(  "n",  "<leader>fb",        "<cmd>Telescope buffers show_all_buffers=true<cr>",                  opts  )
    keymap(  "n",  "<leader>ff",        "<cmd>Telescope find_files<cr>",                                     opts  )
    keymap(  "n",  "<leader>fr",        "<cmd>Telescope lsp_references<cr>",                                 opts  )
    keymap(  "n",  "<leader>fo",        "<cmd>Telescope oldfiles<cr>",                                       opts  )
    keymap(  "n",  "<leader>fp",        "<cmd>lua require('telescope').extensions.projects.projects()<cr>",  opts  )
    keymap(  "n",  "<leader>gc",        "<cmd>Telescope git_commits<CR>",                                    opts  )
    keymap(  "n",  "<leader>gs",        "<cmd>Telescope git_status<CR>",                                     opts  )
    keymap(  "n",  "<leader>sa",        "<cmd>Telescope autocommands<cr>",                                   opts  )
    keymap(  "n",  "<leader>sb",        "<cmd>Telescope current_buffer_fuzzy_find<cr>",                      opts  )
    keymap(  "n",  "<leader>sc",        "<cmd>Telescope command_history<cr>",                                opts  )
    keymap(  "n",  "<leader>sC",        "<cmd>Telescope commands<cr>",                                       opts  )
    keymap(  "n",  "<leader>sd",        "<cmd>Telescope diagnostics bufnr=0<cr>",                            opts  )
    keymap(  "n",  "<leader>sD",        "<cmd>Telescope diagnostics<cr>",                                    opts  )
    keymap(  "n",  "<leader>sh",        "<cmd>Telescope help_tags<cr>",                                      opts  )
    keymap(  "n",  "<leader>sH",        "<cmd>Telescope highlights<cr>",                                     opts  )
    keymap(  "n",  "<leader>sk",        "<cmd>Telescope keymaps<cr>",                                        opts  )
    keymap(  "n",  "<leader>sM",        "<cmd>Telescope man_pages<cr>",                                      opts  )
    keymap(  "n",  "<leader>sm",        "<cmd>Telescope marks<cr>",                                          opts  )
    keymap(  "n",  "<leader>so",        "<cmd>Telescope vim_options<cr>",                                    opts  )
    keymap(  "n",  "<leader>sR",        "<cmd>Telescope resume<cr>",                                         opts  )

    local icons = require "rosxnb.icons"
    local actions = require "telescope.actions"

    require("telescope").setup {
        defaults = {
            prompt_prefix = icons.ui.Telescope .. " ",
            selection_caret = icons.ui.Forward .. " ",
            entry_prefix = "   ",
            initial_mode = "insert",
            selection_strategy = "reset",
            path_display = { "smart" },
            color_devicons = true,
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["q"] = actions.close,
                },
            },
        },
        pickers = {
            live_grep = {
                theme = "dropdown",
            },

            grep_string = {
                theme = "dropdown",
            },

            find_files = {
                theme = "dropdown",
                previewer = false,
            },

            git_files = {
                theme = "dropdown",
                previewer = false,
            },

            old_files = {
                theme = "dropdown",
                previewer = false,
            },

            buffers = {
                theme = "dropdown",
                previewer = false,
                initial_mode = "normal",
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },

            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = {
                enable_preview = true,
            },

            lsp_references = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_definitions = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_declarations = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_implementations = {
                theme = "dropdown",
                initial_mode = "normal",
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    }
end

return M
