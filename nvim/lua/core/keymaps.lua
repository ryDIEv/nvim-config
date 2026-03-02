-- Кеймапы: всё основное под leader (Space)

local map = vim.keymap.set

-- Меню и гайд
map("n", "<leader>m", "<cmd>Alpha<CR>", { desc = "Меню (Alpha)" })
map("n", "<leader>h", "<cmd>Guide<CR>", { desc = "Guide" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Grep (rg)" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",    { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",  { desc = "Help" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",   { desc = "Recent files" })

-- Oil
map("n", "-", "<cmd>Oil<CR>", { desc = "Oil" })
map("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Explorer (Oil)" })
map("n", "<leader>E", "<cmd>Oil --float<CR>", { desc = "Explorer (Oil float)" })

-- Trouble (ошибки/диагностика)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>",      { desc = "Quickfix (Trouble)" })

-- Быстрый “закрыть буфер”; если буферов не осталось — вернуться в меню
map("n", "<leader>bd", function()
  pcall(vim.cmd, "bd")
  local listed = vim.fn.getbufinfo({ buflisted = 1 })
  if #listed == 0 then pcall(vim.cmd, "Alpha") end
end, { desc = "Close buffer (to menu if last)" })
