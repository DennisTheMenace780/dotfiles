local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- use("prettier/vim-prettier")

	use({
		"neanias/everforest-nvim",
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup()
		end,
	})

	use({ "windwp/nvim-ts-autotag" })
	-- DapUI
	-- see https://davelage.com/posts/nvim-dap-getting-started/
	-- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- use({
	-- 	"ldelossa/gh.nvim",
	-- 	requires = { { "ldelossa/litee.nvim" } },
	-- })

	-- Telekastin
	use({ "renerocksai/telekasten.nvim", requires = {} })

	-- Leap
	use({
		"ggandor/leap.nvim",
		requires = {
			"tpope/vim-repeat",
		},
	})

	-- Nvim-tree
	use({ "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Buffer Managers
	use("j-morano/buffer_manager.nvim")

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	})

	-- Colorschemes
	use("catppuccin/nvim")
	use("rebelot/kanagawa.nvim")
	use("EdenEast/nightfox.nvim")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Autopairs
	use("windwp/nvim-autopairs")

	-- Icon Themes
	use("ryanoasis/vim-devicons")

	-- CMP Plugins
	use("hrsh7th/nvim-cmp") -- Completion Plugin
	use("hrsh7th/cmp-buffer") -- Buffer Completions
	use("hrsh7th/cmp-path") -- Path Completions
	use("hrsh7th/cmp-cmdline") -- CMD Line completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-nvim-lua")

	use({ "kevinhwang91/nvim-bqf", ft = "qf" }) -- optional
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/playground",
		},
		run = ":TSUpdate",
	})

	-- LSP Packages
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- Easy installer for language servers
	use("williamboman/mason-lspconfig.nvim")
	use("nvimtools/none-ls.nvim")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Telescope
	--
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Gitsigns
	use("lewis6991/gitsigns.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
