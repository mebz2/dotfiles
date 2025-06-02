-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight copied text',
	group = vim.api.nvim_create_augroup('hightlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


-- terminal
vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "typst" }, -- ← added "typst"
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "en_us" }
	end,
})
