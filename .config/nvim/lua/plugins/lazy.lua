require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-lint",
    "rshkarin/mason-nvim-lint",
    "sindrets/diffview.nvim",
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
      "hrsh7th/cmp-buffer", -- buffer auto-completion
      "hrsh7th/cmp-path", -- path auto-completion
      "hrsh7th/cmp-cmdline", -- cmdline auto-completion
    },
    config = function()
      require("plugins/cmp")
    end,
  },
  { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true, opts = {} },
  "windwp/nvim-ts-autotag",
  { 'numToStr/Comment.nvim', opts = {} },
  {
    "kylechui/nvim-surround",
    version="*",
    event="VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
});

