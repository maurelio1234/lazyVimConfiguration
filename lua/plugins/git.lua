return {
  {
    'ruifm/gitlinker.nvim',
    depend  = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup()
    end
  },
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        -- https://github.com/folke/snacks.nvim/issues/719#issuecomment-2610398349
        win = {
          width = 0,
          height = 0
        },
      }
    }
  }
}
