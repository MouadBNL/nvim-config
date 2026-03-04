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



-- Move current line up/down in Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected lines in Visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Move line in Insert mode (returns to insert at same spot)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
