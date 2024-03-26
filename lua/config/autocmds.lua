-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- setting the working directory to the current buffer's directory
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "lcd %:p:h",
})

vim.api.nvim_create_augroup("VueMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  group = "VueMappings",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cI', ':FindVueFiles<CR>', { noremap = true, silent = true, desc = "Find possible implementations of current compoennt" })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cu', ':FindVueUsages<CR>', { noremap = true, silent = true, desc = "Find possible usages of current component"})
  end,
})

