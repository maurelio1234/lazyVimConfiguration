-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>bp", "<cmd>CopyCurrentPwd<cr>", { desc = "Copy cmd to cd to current pwd to clipboard" })
vim.keymap.set("n", "<leader>cw", "<cmd>SwitchTestCode<cr>", { desc = "Switch between test and code" })
vim.keymap.set("n", "<leader>gm", "<cmd>Magit<cr>", { desc = "Magit" })
vim.keymap.set("n", "<leader>fN", "<cmd>ShowFilePathFromGitRoot<cr>", { desc = "Show current file path from git root" })
vim.keymap.set("n", "<leader>cg", "<cmd>LiveGrepCurrentWord<cr>", { desc = "Grep current word in project "})
vim.keymap.set("n", "<leader>cL", "<cmd>GitFilesCurrentWord<cr>", { desc = "Find file named after current word in project "})
