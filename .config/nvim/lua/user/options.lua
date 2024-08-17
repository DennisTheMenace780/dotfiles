-- Vim Options
-- vim.opt.relativenumber = true -- Shows relative line numbers
vim.opt.number = true -- Shows current line number
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.swapfile = false -- Creates swap files
vim.opt.smartindent = true -- Smart indenting on new lines
vim.opt.tabstop = 4 -- Insert 4 spaces for a tab
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.autoindent = true
-- vim.opt.splitright = false -- Force all vertical splits to go to right of current window
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 1000
vim.opt.textwidth = 80

-- Netrw Options
vim.g.loaded_netrw = 1 -- Disables netrw
vim.g.loaded_netrwPlugin = 1

-- Ruby Provider
vim.g.ruby_host_prog = "/Users/dennisjosephgray/.rvm/gems/ruby-3.2.2/bin/neovim-ruby-host"


