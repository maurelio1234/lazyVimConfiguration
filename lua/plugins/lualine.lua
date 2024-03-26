return {
  {
    "justinhj/battery.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("battery").setup({}) -- Optional: Any configuration setup for battery.nvim can go here
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "justinhj/battery.nvim",
    },
    config = function()
      local nvimbattery = {
        function()
            local m_battery = require("battery")
            if not m_battery.get_battery_status().ac_power then
                return m_battery.get_status_line()
            else 
                return ""
            end
        end
      }
      require("lualine").setup({
        update_rate_seconds = 120,
        sections = {
          lualine_z = { nvimbattery },
        },
      })
    end,
  },
}
