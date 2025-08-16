-- Keymaps
vim.keymap.set("n","<leader>a", "go<S-v>G") -- Select all

vim.keymap.set('n', '<leader>o', ":update<CR> :so<CR>") -- source init.lua 
vim.keymap.set({'i', 'v'}, '<C-[>', "<Esc>") -- go to normal mode from insert and visual
vim.keymap.set('n', 'j', 'gj')	-- allows you to move up
vim.keymap.set('n', 'k', 'gk') -- and down a warpped line

vim.keymap.set({ 'n', 'v' }, 'L', '$') -- goto end of the line
vim.keymap.set({ 'n', 'v' }, 'H', '^') -- goto beginning of the line

vim.keymap.set('n', 'K', vim.lsp.buf.hover) -- hover information
vim.keymap.set("n", "gd", vim.lsp.buf.definition) -- go to definition

vim.keymap.set('n', '<leader>w', ':write<CR>') -- write
vim.keymap.set('n', '<leader>q', ':quit<CR>') -- quit
vim.keymap.set('n', '<leader>tp', ':TypstPreview<CR>') -- typst preview
vim.keymap.set('n', '<leader>fq', ':q!<CR>') -- Force quit
vim.keymap.set('n', 'Y', 'y$', { desc = "yank till end of the line" })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>') -- go to the next file in the buffer
vim.keymap.set('n', '<leader>bp', ':bprev<CR>') -- go to the previous file in the buffer
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename) -- rename varibles, function etc


vim.keymap.set('n', '<leader>xv', ':vsplit<CR>') -- split vertically

-- Diagnostics
vim.keymap.set('n', '<leader>dn', function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = true })
end)
vim.keymap.set('n', '<leader>dp', function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN, float = true })
end)

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


