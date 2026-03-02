return {
  -- Тема
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = false,
        colors = {
          red = "#ff3b30",
          purple = "#b347ff",
          bg0 = "#0b0b0f",
          bg1 = "#0f0f16",
        },
        highlights = {
          Normal = { bg = "#0b0b0f" },
          NormalFloat = { bg = "#0b0b0f" },
          FloatBorder = { fg = "#3a3a48", bg = "#0b0b0f" },
        },
      })
      vim.cmd.colorscheme("onedark")
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Меню
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 900,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.alpha") end,
  },
  -- UI
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.ui").lualine() end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("plugins.ui").which_key() end,
  },

  -- Файлы
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.oil") end,
  },

  -- Поиск
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("plugins.telescope") end,
  },

  -- Completion
  { "hrsh7th/cmp-nvim-lsp", lazy = false },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function() require("plugins.cmp") end,
  },

  -- Пассивные улучшения
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function() require("plugins.ui").illuminate() end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },
}
