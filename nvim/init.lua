-- nvim-config v1.0

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true, noremap = true })

require("core.options")
require("core.keymaps")
require("core.autocmds")

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"), {
  defaults = { lazy = true },
  ui = { border = "rounded" },
  install = { colorscheme = { "onedark" } },
})

-- LSP после lazy: нужен cmp-nvim-lsp (он грузится сразу)
require("core.lsp")
