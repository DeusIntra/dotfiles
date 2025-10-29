return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    {
      'theHamsta/nvim-dap-virtual-text',
      dependencies = {
        {
          "nvim-treesitter/nvim-treesitter",
        }
      }
    },
  },
}
