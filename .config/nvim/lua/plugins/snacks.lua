return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
  keys = {
    { "<leader>,",  function() Snacks.picker.buffers() end,         desc = "Buffers" },
    { "<leader>/",  function() Snacks.picker.grep() end,            desc = "Grep" },
    { "<leader>:",  function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n",  function() Snacks.picker.notifications() end,   desc = "Notification History" },
    { "<leader>ff", function() Snacks.picker.files() end,           desc = "Find Files" },
  }
}
