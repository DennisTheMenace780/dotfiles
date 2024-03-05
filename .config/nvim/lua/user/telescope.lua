local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local action_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local transform_mod = require("telescope.actions.mt").transform_mod

local local_actions = {}

local_actions.vsplit_leftabove = {
	pre = function(prompt_bufnr)
		action_state
			.get_current_history()
			:append(action_state.get_current_line(), action_state.get_current_picker(prompt_bufnr))
	end,
	action = function(prompt_bufnr)
		return action_set.edit(prompt_bufnr, "vertical leftabove split")
	end,
}

local_actions.vsplit_rightbelow = {
	pre = function(prompt_bufnr)
		action_state
			.get_current_history()
			:append(action_state.get_current_line(), action_state.get_current_picker(prompt_bufnr))
	end,
	action = function(prompt_bufnr)
		return action_set.edit(prompt_bufnr, "vertical rightbelow split")
	end,
}

local_actions.hsplit_leftabove = {
	pre = function(prompt_bufnr)
		action_state
			.get_current_history()
			:append(action_state.get_current_line(), action_state.get_current_picker(prompt_bufnr))
	end,
	action = function(prompt_bufnr)
		return action_set.edit(prompt_bufnr, "horizontal leftabove split")
	end,
}

local_actions.hsplit_rightbelow = {
	pre = function(prompt_bufnr)
		action_state
			.get_current_history()
			:append(action_state.get_current_line(), action_state.get_current_picker(prompt_bufnr))
	end,
	action = function(prompt_bufnr)
		return action_set.edit(prompt_bufnr, "horizontal rightbelow split")
	end,
}
local_actions = transform_mod(local_actions)

telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		-- path_display = { "truncate=3"},

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				-- ["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-l>"] = actions.select_horizontal,
				["<C-j>"] = actions.select_vertical,
				-- ["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				-- ["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>

        -- LGA Actions
        ["<C-r>"] = lga_actions.quote_prompt({ postfix = " -g '!*_spec.rb'"})
			},

			n = {
				["<C-h>"] = local_actions.vsplit_leftabove,
				["<C-l>"] = local_actions.vsplit_rightbelow,
				["<C-j>"] = local_actions.hsplit_rightbelow,
				["<C-k>"] = local_actions.hsplit_leftabove,
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		-- buffers = {
		--    initial_mode = "normal"
		--}
	},
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		-- live_grep_args = {
  --     mappings = {
  --       i = {
  --         ["C-t"] = lga_actions.quote_prompt({postfix = " -T{*.test.*}"})
  --         -- ["C-t"] = lga_actions.quote_prompt({postfix = ""})
  --       }
  --     }
  --   },
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		--[[         fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        } ]]
	},
})
telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
