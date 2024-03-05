local status_ok, buffer_manager = pcall(require, "buffer_manager")
if not status_ok then
	return
end

buffer_manager.setup({
	line_keys = "1234567890", -- deactivate line keybindings
	short_file_names = true,
	select_menu_item_commands = {
		vl = {
			key = "<C-h>",
			command = "vertical leftabove split",
		},
		vr = {
			key = "<C-l>",
			command = "vertical rightbelow split",
		},
		hu = {
			key = "<C-k>",
			command = "horizontal leftabove split",
		},
		hd = {
			key = "<C-j>",
			command = "horizontal rightbelow split",
		},
	},
})

vim.api.nvim_command([[
  autocmd FileType buffer_manager vnoremap J :m '>+1<CR>gv=gv
  autocmd FileType buffer_manager vnoremap K :m '<-2<CR>gv=gv
]])
