local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all", "maintained", or list of languages.
	sync_install = false, -- install languages synchronously
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, --  false will disable whole extension
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	autopairs = {
		enable = true,
	},
  -- Slated for removal 
	-- context_commentstring = {
	-- 	enable = true,
	-- 	enable_autocmd = false,
	-- },
})
