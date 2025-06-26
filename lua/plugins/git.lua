return {
  {
    'ruifm/gitlinker.nvim',
    depend  = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup()
    end
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    keys = {
      { "<Leader>gg", "<cmd>LazyGit<CR>", desc = "lazygit" },
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  }
}
