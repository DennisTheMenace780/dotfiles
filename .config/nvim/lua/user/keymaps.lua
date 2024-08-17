local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Copilot
vim.keymap.set("i", "<C-y>", 'copilot#Accept("")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- ESLint Server
-- keymap("n", "<leader>le", "<cmd>:EslintFixAll<cr>", opts)
keymap("n", "<leader>le", "<cmd>:!eslint_d --fix --cache %<cr>", opts)

-- Typescript Tools
keymap("n", "<leader>lt", "<cmd>:TSToolsFixAll<cr>", opts)

-- Neotree Keymaps
keymap("n", "<leader>ef", "<cmd>:NvimTreeToggle<cr>", opts)
keymap("n", "<leader>e", "<cmd>:NvimTreeFocus<cr>", opts)

-- Press jj to enter normal mode
keymap("i", "kk", "<ESC>", opts)
keymap("v", "<C-C>", '"+y', opts)

-- Vertical Movements
-- au VimResized * lua vim.o.scroll = math.floor(0.25 * vim.api.nvim_win_get_height(0))
-- local group = vim.api.nvim_create_augroup("Ctrl-Scroll", { clear = true })
-- vim.api.nvim_create_autocmd("WinResized", { command = "Echo 'Hello'"}, group == group)
keymap("n", "<C-d>", "0<C-d>zz", opts)
keymap("n", "<C-u>", "0<C-u>zz", opts)

-- Telescope
keymap(
	"n",
	"<leader>f",
	-- "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true, layout_config={width=0.75} }))<cr>",
	"<cmd>lua require'telescope.builtin'.find_files({layout_strategy='horizontal', layout_config={width=0.75}})<cr>",
	opts
)
keymap(
	"n",
	"<leader>gb",
	"<cmd>lua require'telescope.builtin'.git_branches(require('telescope.themes').get_dropdown({ previewer = false, show_remote_tracking_branches = false }))<cr>",
	opts
)
keymap(
	"n",
	"<leader>gs",
	"<cmd>lua require'telescope.builtin'.git_stash(require('telescope.themes').get_dropdown({ previewer = false, show_remote_tracking_branches = false }))<cr>",
	opts
)
keymap(
	"n",
	"<leader>ls",
	"<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes')<cr>",
	opts
)
-- keymap("n", "<cr>", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>rg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)

-- Buffer Manager
keymap("n", "<C-m>", "<cmd>lua require'buffer_manager.ui'.toggle_quick_menu()<cr>", opts)

-- Window Management
keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-j>", ":wincmd j<CR>", opts)
keymap("n", "<C-k>", ":wincmd k<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)

keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Gitsigns
keymap("n", "<leader>j", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>k", ":Gitsigns prev_hunk<CR>", opts)

-- Telekasten
keymap("n", "<leader>t", ":lua require('telekasten').panel()<CR>", opts)
keymap("n", "<leader>tf", ":lua require('telekasten').find_daily_notes()<CR>", opts)
keymap("n", "<leader>ts", ":lua require('telekasten').search_notes()<CR>", opts)
keymap("n", "<leader>tt", ":lua require('telekasten').follow_link()<CR>", opts)
keymap("n", "<leader>tc", ":lua require('telekasten').show_calendar()<CR>", opts)
keymap("n", "<leader>tv", ":lua require('telekasten').switch_vault()<CR>", opts)
keymap("n", "<leader>tn", ":lua require('telekasten').new_note()<CR>", opts)

