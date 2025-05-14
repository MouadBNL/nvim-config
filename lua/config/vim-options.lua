-- Enabling auto save (maybe change that later)
-- vim.api.nvim_create_autocmd({ "FocusLost", "InsertLeave" }, {
--   pattern = "*",
--   callback = function()
--     vim.cmd("silent! write")
--   end,
-- })

vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.diagnostic.config({
  virtual_text = true,  -- Shows diagnostics inline
  signs = true,         -- Gutter signs (e.g., ❌, ⚠️)
  underline = true,     -- Underline errors
  update_in_insert = false, -- Don't update while typing
  severity_sort = true,     -- Sort diagnostics by severity
})
vim.opt.signcolumn = "yes"
