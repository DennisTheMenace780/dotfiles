local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = {
				"--config",
				"--arrow-parens",
				"avoid",
			},
			extra_filetypes = { "rb", "ruby" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.rustfmt,
		formatting.sql_formatter,
		formatting.golines,
		formatting.gofmt,
		diagnostics.rubocop.with({ extra_args = { "--config", "rubocop_base.yml" } }),
    -- formatting.rubocop,
		-- formatting.rubocop.with({extra_args = {"--auto-correct"}})
		-- diagnostics.rubocop
	},
	diagnostics_format = "[#{c}] #{m} (#{s})",
})
-- Helps with rust-analyzer finding projects
-- "rust-analyzer.linkedProjects": [
--         "Cargo.toml",
--         "cross/Cargo.toml",
--     ]
