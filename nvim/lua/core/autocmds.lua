-- Автокоманды и пользовательские команды

-- Подсветка yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Возврат в Alpha, если закрыли всё
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local listed = vim.fn.getbufinfo({ buflisted = 1 })
    if #listed == 0 then
      vim.schedule(function()
        pcall(vim.cmd, "Alpha")
      end)
    end
  end,
})

-- Открыть GUIDE.md
vim.api.nvim_create_user_command("Guide", function()
  local guide = vim.fn.stdpath("config") .. "/GUIDE.md"
  vim.cmd("edit " .. guide)
end, {})

-- Авто-старт Alpha: если старт пустой ИЛИ старт в каталоге (nvim . / nvim <dir>)
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)

    local is_dir = (name ~= "" and vim.fn.isdirectory(name) == 1)
    local is_empty = (vim.api.nvim_buf_line_count(buf) == 1)
      and (vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == "")

    if vim.fn.argc() == 0 and is_empty and vim.bo[buf].buftype == "" and vim.bo[buf].filetype == "" then
      vim.schedule(function() pcall(vim.cmd, "Alpha") end)
      return
    end

    if is_dir and is_empty and vim.bo[buf].filetype == "" then
      vim.schedule(function() pcall(vim.cmd, "Alpha") end)
    end
  end,
})
