local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- make space key as leader key
keymap( "", "<Space>", "<Nop>", opts )
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-------------- Insert Mode mappings  -------------------------
-- Press zz fast to exit insert mode 
keymap("i", "kj", "<ESC>", opts)


-------------- Normal Mode mappings  -------------------------
-- keymap("n", "<leader>r", ":so ~/.config/nvim/init.lua<CR>", opts)  -- source the config file

-- maintain cursor position while moving half page
keymap(  "n",  "<C-d>",  "<C-d>zz",  opts  )
keymap(  "n",  "<C-u>",  "<C-u>zz",  opts  )
keymap(  "n",  "n",      "nzz",      opts  )
keymap(  "n",  "N",      "Nzz",      opts  )
keymap(  "n",  "*",      "*zz",      opts  )
keymap(  "n",  "#",      "#zz",      opts  )
keymap(  "n",  "g*",     "g*zz",     opts  )
keymap(  "n",  "g#",     "g#zz",     opts  )

-- splitting window
keymap(  "n",  "<leader>\\",  "<C-w>v",      opts  )
keymap(  "n",  "<leader>-",   "<C-w>s",      opts  )
keymap(  "n",  "<leader>=",   "<C-w>=",      opts  )
keymap(  "n",  "<leader>x",   ":close<CR>",  opts  )

-- window navigation
keymap(  "n",  "<C-h>",  "<C-w>h",  opts  )
keymap(  "n",  "<C-j>",  "<C-w>j",  opts  )
keymap(  "n",  "<C-k>",  "<C-w>k",  opts  )
keymap(  "n",  "<C-l>",  "<C-w>l",  opts  )

-- resize windows with arrow
keymap(  "n",  "<C-=>",    "<C-w>=",                   opts  )
keymap(  "n",  "<Up>",     ":resize -2<CR>",           opts  )
keymap(  "n",  "<Down>",   ":resize +2<CR>",           opts  )
keymap(  "n",  "<Left>",   ":vertical resize -2<CR>",  opts  )
keymap(  "n",  "<Right>",  ":vertical resize +2<CR>",  opts  )

-- maximizer plugin 
-- keymap("n", "<leader>m", ":MaximizerToggle<CR>", opts)

-- tabs settings
keymap(  "n",  "<leader>bn",  ":tabnew<CR>",    opts  )
keymap(  "n",  "<leader>bx",  ":tabclose<CR>",  opts  )
keymap(  "n",  "<leader>bl",  ":tabn<CR>",      opts  )
keymap(  "n",  "<leader>bh",  ":tabp<CR>",      opts  )

-- left side explorer
-- keymap("n", "<leader>e", ":Lexplore 15<cr>", opts)

-- buffer navigation
keymap(  "n",  "<S-l>",  ":bnext<CR>",      opts  )
keymap(  "n",  "<S-h>",  ":bprevious<CR>",  opts  )

-- move text up and down
keymap(  "n",  "∆",  "<Esc>:m .+1<CR>==",  opts  )
keymap(  "n",  "˚",  "<Esc>:m .-2<CR>==",  opts  )


-------------- Visual Mode mappings  -------------------------
-- stay in indent mode
keymap(  "v",  "<",  "<gv",  opts  )
keymap(  "v",  ">",  ">gv",  opts  )

-- move text up and Down
keymap(  "v",  "∆",  ":m .+1<CR>==",  opts  )
keymap(  "v",  "˚",  ":m .-2<CR>==",  opts  )
keymap(  "v",  "p",  '"_dP',          opts  )


-------------- Visual Block Mode mappings  -------------------------
-- move text up and down
keymap(  "x",  "J",  ":move '>+1<CR>gv=gv",  opts  )
keymap(  "x",  "K",  ":move '<-2<CR>gv=gv",  opts  )
keymap(  "x",  "∆",  ":move '>+1<CR>gv=gv",  opts  )
keymap(  "x",  "˚",  ":move '<1<CR>gv=gv",   opts  )
