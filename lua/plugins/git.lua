return {
  {
    'ruifm/gitlinker.nvim',
    depend  = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup()
    end
  }
}
