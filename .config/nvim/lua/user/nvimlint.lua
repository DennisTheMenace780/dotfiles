local status_ok, nvim_lint = pcall(require, "lint")
if not status_ok then
	return
end

nvim_lint.linters_by_ft = {
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
  css = { "stylelint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
	callback = function()
		nvim_lint.try_lint()
	end,
})
