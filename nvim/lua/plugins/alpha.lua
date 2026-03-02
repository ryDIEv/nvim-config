local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

vim.api.nvim_set_hl(0, "AlphaHeaderRed", { fg = "#ff3b30", bold = true })
vim.api.nvim_set_hl(0, "AlphaNickRed",   { fg = "#ff3b30", bold = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.foldcolumn = "0"
  end,
})

local function trim_right(s) return (s:gsub("%s+$", "")) end

local function center_block(lines)
  local win = vim.api.nvim_get_current_win()
  local info = (vim.fn.getwininfo(win)[1] or {})
  local width = vim.api.nvim_win_get_width(win) - (info.textoff or 0)

  local maxlen = 0
  for _, s in ipairs(lines) do
    local len = vim.fn.strdisplaywidth(s)
    if len > maxlen then maxlen = len end
  end
  local pad = math.max(0, math.floor((width - maxlen) / 2))
  local prefix = string.rep(" ", pad)

  local out = {}
  for _, s in ipairs(lines) do out[#out + 1] = prefix .. s end
  return out
end

local big_logo = [[
70578843777753700
    1 7 777 66644641777  7
       777777174556800007 7
         77 77  668806421773777
          7 71759965317 777324557          72 7
          77553288966217135680088277    771927
          7700032580004249000943367      96007
         771 770032600000000633337 7    7 10080001      52
                70086000000000000    177 72000000000  75082
                 7490000000000007    004100000000000000042
                 7100000000000002   7000000000000800004777
                  500086000000000   2200000000000000057
                 0043   7730000070   77600000000000071
                           300000991   709998800008727
     777  7                77777117 77 067371123177
    7777                   77 7 00000005371777
    7    7                 77125232311117 77
777                      5826677770084317712677
7777                  7 35097777556000884359007
777                    708677771552254000041600037
757                    00377 72000096600017 79000007
77077               776005    100000000377    773600000002311
 061            7100000027  10000080000576777      100042377
 2001            1307057  73900000000000000000057    017
   0497             09 717160000000000000000000000
    9  777 7        7  77045 770888888000005866804
      77777 7777113377717777 7777 77 777 77533217
           7 777777 7         776969  7 7771717
                           7 76989777 71717  7
                         7 669998477 794546817
                        7200009777     777400066 7
                       2019777777         7 7  17
                    000777
                    65221
                    701177
                     7236077
                      7 77777
]]

local logo_lines = vim.split(big_logo, "\n", { trimempty = true })
for i, s in ipairs(logo_lines) do logo_lines[i] = trim_right(s) end
logo_lines = center_block(logo_lines)

dashboard.section.header = {
  type = "text",
  val = logo_lines,
  opts = { position = "left", hl = "AlphaHeaderRed" },
}

local nick_lines = {
  "    ┳┓┳┏┓",
  "┏┓┓┏┃┃┃┣ ┓┏",
  "┛ ┗┫┻┛┻┗┛┗┛",
  "   ┛",
}
for i, s in ipairs(nick_lines) do nick_lines[i] = trim_right(s) end
nick_lines = center_block(nick_lines)

dashboard.section.nick = {
  type = "text",
  val = nick_lines,
  opts = { position = "left", hl = "AlphaNickRed" },
}

local function path_line()
  local cur = vim.fn.expand("%:p")
  if cur ~= "" then return "󰈙  " .. cur end
  local alt = vim.fn.expand("#:p")
  if alt ~= "" then return "󰈙  " .. alt end
  return "  " .. vim.fn.getcwd()
end

dashboard.section.path = {
  type = "text",
  val = path_line(),
  opts = { position = "center", hl = "Comment" },
}

local guide = vim.fn.stdpath("config") .. "/GUIDE.md"
dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", "<cmd>enew<CR>"),
  dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("g", "󰋖  Guide", "<cmd>edit " .. guide .. "<CR>"),
  dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}
dashboard.section.buttons.opts = { position = "center" }

dashboard.config.layout = {
  { type = "padding", val = 1 },
  dashboard.section.header,
  { type = "padding", val = 0 },
  dashboard.section.nick,
  { type = "padding", val = 0 },
  dashboard.section.path,
  { type = "padding", val = 1 },
  dashboard.section.buttons,
  { type = "padding", val = 0 },
}

alpha.setup(dashboard.config)

