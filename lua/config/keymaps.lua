-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>cw", "<cmd>SwitchTestCode<cr>", { desc = "Switch between test and code" })
vim.keymap.set("n", "<leader>gm", "<cmd>Magit<cr>", { desc = "Magit" })
vim.keymap.set("n", "<leader>fN", "<cmd>ShowFilePathFromGitRoot<cr>", { desc = "Show current file path from git root" })
