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
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
      model = "claude-3.5-sonnet",
      prompts = {
        MigrateVue3 = {
          prompt = "Migrate Vue 2 to Vue 3 composition API",
          system_prompt = 'You are very good at migrating code stuff',
          context = "buffer"
        }
      }
    },
    -- See Commands section for default commands if you want to lazy load on them
    lazy = false -- https://github.com/CopilotC-Nvim/CopilotChat.nvim/issues/451
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
