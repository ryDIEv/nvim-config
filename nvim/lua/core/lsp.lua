-- LSP: ориентир на C (clangd) + bash

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  update_in_insert = false,
  float = { border = "rounded" },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = cmp.default_capabilities(capabilities)
end

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
  },
  capabilities = capabilities,
})
vim.lsp.enable("clangd")

vim.lsp.config("bashls", {
  cmd = { "bash-language-server", "start" },
  capabilities = capabilities,
})
vim.lsp.enable("bashls")
