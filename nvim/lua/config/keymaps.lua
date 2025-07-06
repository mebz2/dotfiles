-- leader
vim.g.mapleader = " "

-- to go into normal mode from insert mode
vim.keymap.set("i", "jj", "<Esc>", {})

-- explore
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")

-- source current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- run current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- run selected lines
vim.keymap.set("v", "<space>x", ":lua<CR>")


-- to traverse through wrapping lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

--quick fix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)


-- live server
vim.keymap.set("n", "<leader>ls", "<cmd>!live-server<CR>")

-- end and beginning of line
vim.keymap.set({ 'n', 'v' }, 'L', '$', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { noremap = true })

-- tabs
vim.keymap.set('n', '<leader>ta', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { noremap = true, silent = true })

-- lsp keymaps
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, vim.opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, vim.opts)
