-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup("VueMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  group = "VueMappings",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cI', ':FindVueFiles<CR>', { noremap = true, silent = true, desc = "Find possible implementations of current compoennt" })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cu', ':FindVueUsages<CR>', { noremap = true, silent = true, desc = "Find possible usages of current component"})
  end,
})
vim.api.nvim_create_augroup("ExercismMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  group = "ExercismMappings",
  callback = function()
    local filepath = vim.fn.expand('%:p:h')
    if string.match(filepath, '/Users/Marcos/Exercism') then
      vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ct', ':terminal cd %:p:h && exercism test<CR>', { noremap = true, silent = true, desc = "Run test" })
    end
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  group = "ExercismMappings",
  callback = function()
    local filepath = vim.fn.expand('%:p:h')
    if string.match(filepath, '/Users/Marcos/Exercism') then
      vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cb', ':terminal cd %:p:h && exercism submit<CR>', { noremap = true, silent = true, desc = "Submit file" })
    end
  end,
})

vim.api.nvim_create_augroup("LuaMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  group = "LuaMappings",
  callback = function()
    vim.bo.shiftwidth = 2
  end,
})
