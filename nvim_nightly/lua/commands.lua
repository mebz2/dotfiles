-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight copied text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
