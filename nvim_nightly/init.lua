require("options")
require("commands")
require("keymaps")

-- Pickfiles
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

-- Plugins
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{src = "https://github.com/ellisonleao/gruvbox.nvim"},
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", ":TSUpdate" }, --, run = ":TSUpdate"
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" }, { src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/derektata/lorem.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp" },
})
-- lorem
require("lorem").opts {
	sentence_length = "mixed", -- using a default configuration
	comma_chance = 0.3,       -- 30% chance to insert a comma
	max_commas = 2,           -- maximum 2 commas per sentence
	debounce_ms = 200,
}
-- autopairs for automatically closing quotations and brackets
require("nvim-autopairs").setup()
-- typst preview
require("typst-preview").setup()
-- auto close tag and rename for html and other similar languages
require("nvim-ts-autotag").setup()
-- for autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")
-- telescope like picker
vim.cmd('packadd mini.pick')
require "mini.pick".setup()
-- mason
vim.cmd('packadd mason.nvim')
require "mason".setup()
-- treesitter
require "nvim-treesitter.configs".setup({
	ensure_installed = { "svelte", "typescript", "javascript", "html", "css", "php", "python", "cpp" },
	highlight = { enable = true }
})
-- oil file explorer
require "oil".setup()
-- color scheme
-- require "vague".setup({ transparent = false})
require "gruvbox".setup({})
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
vim.cmd(":hi statusline guibg=NONE")

-- lsp
vim.lsp.enable({ "lua_ls", "html", "cssls", "clangd", "bashls", "gopls", "tinymist", "pylsp", "phpactor", "vtls",
	"rust_analyzer", "bashls", "eslint-lsp", "typescript-language-server", })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})
vim.lsp.config("lspconfig", {
	settings = {
		pylsp = {
			plugins = {
				psycodestyle = {
					ignore = { 'W391' },
					maxLineLength = 100,
				}
			}
		}
	}
})
