local M = {}

function M.lualine()
  require("lualine").setup({
    options = {
      theme = "onedark",
      globalstatus = true,
      section_separators = "",
      component_separators = "",
    },
  })
end

function M.which_key()
  local wk = require("which-key")
  wk.setup({})
  wk.add({
    { "<leader>f", group = "find" },
    { "<leader>e", group = "explorer" },
    { "<leader>x", group = "diagnostics" },
    { "<leader>m", group = "menu" },
    { "<leader>b", group = "buffer" },
  })
end

function M.illuminate()
  require("illuminate").configure({
    delay = 120,
    under_cursor = true,
    filetypes_denylist = { "alpha", "oil" },
  })
end

return M
