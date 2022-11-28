local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.gtd.base"] = {
			config = {
				workspace = "fake_gtd",
				workspace2 = "sprint_1",
			},
		},
		["core.norg.concealer"] = {
			config = {
				icon_preset = "diamond",
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					home = "~/neorg_notes/home",
					work = "~/neorg_notes/work",
					fake_gtd = "~/neorg_notes/gtd",
					sprint_1 = "~/neorg_notes/gtd/test_spring_1",
				},
			},
		},
		["external.kanban"] = {
			config = {
				task_states = {
					"undone",
					"pending",
					"done",
					"cancelled",
					"uncertain",
					"urgent",
					"recurring",
					"on_hold",
				},
			},
		},
	},
})
