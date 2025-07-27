-- Options
vim.o.number = true
vim.g.mapleader = " "
vim.o.colorcolumn = "115"
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.relativenumber = true
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.o.guicursor = "i:block"
vim.o.scrolloff = 20
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keymaps
vim.keymap.set('n', '<leader>o', ":update<CR> :so<CR>")
vim.keymap.set('i', 'jj', "<Esc>")
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set({ 'n', 'v' }, 'L', '$')
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight copied text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- plugins
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- for autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'rounded',
  }
)

vim.cmd("set completeopt+=noselect")


vim.cmd('packadd mini.pick')
require "mini.pick".setup()

vim.cmd('packadd mason.nvim')
require "mason".setup({
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}
	}
})

require "nvim-treesitter.configs".setup({
	ensure_installed = { "svelte", "typescript", "javascript", "html", "css", "php", "python", "cpp" },
	highlight = { enable = true }
})

require "oil".setup()

vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', ":Oil<CR>")


require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- lsp
vim.lsp.enable({ "lua_ls", "html-lsp", "css-lsp", "clangd", "bashls"})
