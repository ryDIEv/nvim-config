-- Опции: читаемо и без шума

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 4
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"

vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Отступы: по умолчанию 2 пробела
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Ускорение/шум
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- netrw отключаем (Oil будет file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
