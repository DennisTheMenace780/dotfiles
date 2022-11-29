local buf = 1
local queries = module.required["core.gtd.queries"]
local tasks = queries.get("tasks", {bufnr = buf})

local projects = queries.get("projects", {bufnr = buf})

print(tasks, projects)
