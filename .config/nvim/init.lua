-- Load Options, Keymaps, and Plugins
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.buffer_manager")
require("user.colorscheme")
require("user.nvim-ts-autotag")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.toggleterm")
require("user.autopairs")
require("user.lualine")
require("user.leap")
require("user.dapui")
require("user.gitsigns")
require("user.telekasten")
require("user.nvimtree")

-- require("nvim-tree").setup({})
-- vim.api.nvim_create_autocmd("Filetype", {
-- 	group = vim.api.nvim_create_augroup("colorscheme", { clear = true }),
-- 	pattern = { "markdown" },
-- 	command = "colorscheme dayfox",
-- })
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })
--

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D6D6D6" })

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*.md" }, command = [[set filetype=markdown]] })
-- vim.api.nvim_command([[
--   autocmd FileType buffer_manager vnoremap J :m '>+1<CR>gv=gv
--   autocmd FileType buffer_manager vnoremap K :m '<-2<CR>gv=gv
-- ]])
local group = vim.api.nvim_create_augroup("Ctrl-Scroll", { clear = true })
vim.api.nvim_create_autocmd("WinResized", {
	callback = function()
		vim.opt.scroll = math.floor(0.25 * vim.fn.winheight(0))
		-- vim.opt.scroll = 25
	end,
	group = group,
})
