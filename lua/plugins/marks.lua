return {
  {
    "chentoast/marks.nvim",
    enabled = false,
    config = function()
      require("marks").setup({
        default_mappings = true,
        builtin_marks = { ".", "<", ">", "^" },
        mappings = {}
      })
    end
  }
}
