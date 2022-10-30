local opts = { noremap = true, silent = true }

local term_opts = {silent = true}

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Resize netrdw on open
keymap("n", "<leader>e", ":Lex 20<cr>", opts)

-- Press jj to enter normal mode
keymap("i", "jj", "<ESC>", opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", opts)

