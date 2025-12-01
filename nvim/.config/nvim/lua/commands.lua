vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Auto format",
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L", -- vertical split for help
})
