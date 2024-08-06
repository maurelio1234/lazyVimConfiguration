return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        enabled = false,
      },
      filetypes = {
        ["*"] = true,
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    tag = "v1.0.0",
    opts = {
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                 maxTsServerMemory = 8192
              }
            }
          }
        }
      }
    }
  }
}
