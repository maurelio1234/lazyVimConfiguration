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
            }
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
}
