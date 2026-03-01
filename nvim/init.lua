-- =========================
-- init.lua (минимальный, но “полный” конфиг)
-- =========================

-- =========================
-- базовые опции (минимум)
-- =========================
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = false -- относительная нумерация отключена
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- =========================
-- Lazy bootstrap
-- =========================
-- Скачивает lazy.nvim в стандартную директорию данных Neovim, если его ещё нет.
-- После этого добавляет его в runtimepath, чтобы можно было вызвать require("lazy").
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =========================
-- плагины
-- =========================
require("lazy").setup({
  -- ТЕМА: onedark (warmer)
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "warmer",
        transparent = false,
      })
      require("onedark").load()
    end,
  },

  -- Стартовый экран (alpha-nvim) + ASCII
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- center(lines):
      -- Центрирует список строк (ASCII-арт) по ширине текущего окна.
      -- 1) Находит максимальную визуальную ширину строки (strdisplaywidth учитывает “широкие” символы).
      -- 2) Считает отступ слева (pad).
      -- 3) Добавляет этот отступ ко всем строкам.
      local function center(lines)
        local width = vim.api.nvim_win_get_width(0)
        local maxlen = 0

        for _, s in ipairs(lines) do
          local len = vim.fn.strdisplaywidth(s)
          if len > maxlen then
            maxlen = len
          end
        end

        local pad = math.max(0, math.floor((width - maxlen) / 5))
        local prefix = string.rep(" ", pad)

        local out = {}
        for _, s in ipairs(lines) do
          table.insert(out, prefix .. s)
        end
        return out
      end

      local art = {
        "ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　　　　　　　　　　　 　 .∥",
        "ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　　　　　　　　　　　 　 .∥",
        "　 　 ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　 　 　　　＿__　　 .∥",
        "　　　　ㅤ　ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　 ／　　　 ｀ヽ ∥",
        "ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　　　　　 ,:'　　　　　　､ゑ",
        "ㅤㅤㅤㅤㅤㅤㅤ　ㅤ　ㅤㅤㅤ　　　,'　　 　;　　i　 八､",
        "ㅤㅤㅤ　ㅤㅤㅤㅤㅤㅤㅤㅤ　　　　|,! 、 ,! | 　,' ,〃ヽ!;､ 　",
        "ㅤㅤㅤ　　ㅤㅤㅤㅤㅤㅤㅤㅤ 　 　|!| ｌ川 l ﾘへ'==二二ト､ 　",
        "　　ㅤㅤㅤㅤㅤㅤ　ㅤ　ㅤㅤㅤㅤ　ﾘ川 !| i′　 ﾞ､　　　　', ', 　",
        "　ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　ㅤ　　　lﾙl ||,ﾚ′　　 ヽ　　　,ﾉ ,〉　",
        "　　ㅤㅤㅤㅤㅤㅤ　ㅤㅤㅤㅤㅤ　 　 |川'、　 ,,.,.r'\"　 　 ,,ンﾞ 　",
        "　　　　ㅤㅤㅤㅤㅤㅤ　ㅤㅤㅤㅤㅤ　　　｀T\"　 ! ,/ '.ﾉ,/｜　 　",
        "　　　　　　ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　　 / 　 ,!´　!ﾞヾ{　|",
        "ㅤㅤㅤㅤ　 　 　 　ㅤㅤㅤ 　ㅤㅤㅤㅤ　/ 　 ,' 　 i　ﾞ　! ,lﾞ",
        "　　ㅤㅤㅤㅤ　　ㅤㅤㅤㅤㅤㅤㅤ　　,r‐'ヽ-､!　　 ',　　l｜　",
        "ㅤㅤㅤㅤ　ㅤㅤㅤㅤㅤㅤ　　　ㅤ　 {　　　 ｀ヽ　　 !　 ｢ﾞﾌ 　",
        "　 　ㅤㅤㅤㅤ　ㅤㅤㅤㅤㅤㅤㅤ　　,>┬―／　　 ;　 i,｀{ 　",
        "ㅤㅤㅤ　ㅤㅤㅤㅤㅤㅤㅤ　ㅤ　　　/ /ﾘ川'　 　 　 　 ', ﾞ､",
        "　　ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　 ／ ,/　　　 　 　 　 　 ﾞ､ ﾞ、 　",
        "ㅤㅤㅤ　ㅤㅤㅤㅤㅤㅤㅤㅤ　 ノ 　/　　　　　　　　　　　', ｀､ 　",
        "　ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　 ＼_/　　 ;　　　　　　　　　 ﾞ、ヽ、",
        "　　ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ　　l__　　 !　　　　　　　 _＿_〕",
        "　　　ㅤㅤㅤㅤㅤㅤㅤㅤ　ㅤㅤㅤ　 ￣｀‐┬―r┬‐r'´　｀'‐'′",
        "　　 　 　 ㅤㅤㅤㅤㅤㅤㅤㅤ　ㅤㅤㅤ 　　|　　.! |　 |",
        "　　 　 　 　 　ㅤㅤㅤㅤㅤㅤㅤㅤ　ㅤㅤㅤ|　　| .|　 |",
      }

      dashboard.section.header.val = center(art)

      dashboard.section.buttons.val = {
        dashboard.button("e", "New file", ":enew<CR>"),
        dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
        dashboard.button("q", "Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  },

  -- Файловый менеджер внутри nvim (Oil)
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        view_options = { show_hidden = true },
      })
      -- Быстрый вход в “проводник” (текущая директория/файл)
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil file manager" })
    end,
  },

  -- Telescope для поиска файлов (используется кнопкой на старте)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },

  -- CMP (автодополнение)
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
}, {
  checker = { enabled = false },
})

-- =========================
-- CMP (автодополнение)
-- =========================
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- capabilities:
-- Добавляет в LSP-клиент Neovim “возможности” nvim-cmp,
-- чтобы серверы LSP умели отдавать completion корректно.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- =========================
-- LSP (Neovim 0.11+): vim.lsp.config + vim.lsp.enable
-- =========================
-- vim.lsp.config(name, opts):
-- регистрирует конфиг сервера (команда запуска, capabilities и т.п.).
-- vim.lsp.enable(name):
-- включает автозапуск сервера по filetype.
vim.lsp.config("clangd", {
  cmd = { "clangd" },
  capabilities = capabilities,
})
vim.lsp.enable("clangd")

vim.lsp.config("bashls", {
  cmd = { "bash-language-server", "start" },
  capabilities = capabilities,
})
vim.lsp.enable("bashls")
