local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-6>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-7>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-8>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-9>", function() harpoon:list():select(4) end)
