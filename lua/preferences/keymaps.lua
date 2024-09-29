-- Turn off space when used by itself
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Copy & paste with system clipboard
vim.keymap.set("n", "<leader>cy", "\"+yy", { desc = "[Y]ank current line"})
vim.keymap.set("v", "<leader>cy", "\"+y", { desc = "[Y]ank current visual selection"})
vim.keymap.set("n", "<leader>cp", "\"+p", { desc = "[P]aste into current line"})

-- Move page up and down but keep cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz_", { desc = "[D]own a page (1/2 a screen)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz_", { desc = "[U]p a page (1/2 a screen)" })

-- Center search words
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous [D]iagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next [D]iagnostic" })


-- Autocommands
local general_group = vim.api.nvim_create_augroup("general-commands", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = general,
  callback = function()
    vim.highlight.on_yank()
  end,
})
