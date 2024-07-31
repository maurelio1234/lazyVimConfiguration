-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>bP", "<cmd>CopyCurrentPwd<cr>", { desc = "Copy cmd to cd to current pwd to clipboard" })
vim.keymap.set("n", "<leader>cw", "<cmd>SwitchTestCode<cr>", { desc = "Switch between test and code" })
vim.keymap.set("n", "<leader>fD", "<cmd>lcd %:p:h<cr>", { desc = "Cd to current file's dir" })
vim.keymap.set("n", "<leader>gm", "<cmd>Magit<cr>", { desc = "Magit" })
vim.keymap.set("n", "<leader>fN", "<cmd>ShowFilePathFromGitRoot<cr>", { desc = "Show current file path from git root" })
vim.keymap.set("n", "<leader>cg", "<cmd>LiveGrepCurrentWord<cr>", { desc = "Grep current word in project "})
vim.keymap.set("n", "<leader>cL", "<cmd>GitFilesCurrentWord<cr>", { desc = "Find file named after current word in project "})

if vim.g.neovide then
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

