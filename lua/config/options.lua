-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.omnifunc = "syntaxcomplete#Complete"
vim.o.mouse = "n"
vim.opt.tabstop = 4 -- Set the width of a tab character
vim.opt.shiftwidth = 4 -- Set the width of indentation levels
vim.opt.expandtab = true -- Use spaces instead of tabs for indentation
vim.g.autoformat = false

vim.g.swapfile = false
vim.g.autowrite = true
vim.g.autoread = true
