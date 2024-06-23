return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    keys = {
      {
        "<leader>/",
        function () require("telescope").extensions.live_grep_args.live_grep_args() end,
        desc = "Grep with live args"
      },
      {
        "<leader>fh",
        function() require("telescope.builtin").help_tags() end,
        desc = "Help tags"
      },
      {
        "<leader>fC",
        function() require("telescope.builtin").commands() end,
        desc = "Command"
      }
    },
    config = function()
      local telescope = require('telescope')
      telescope.load_extension("live_grep_args")
      telescope.setup {
        defaults = {
          layout_config = {
            width = 0.9,
          },
          path_display = { "truncate" },
        },
      }
    end
  }
}
