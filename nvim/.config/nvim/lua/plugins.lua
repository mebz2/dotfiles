vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
	{ src = "https://github.com/aznhe21/actions-preview.nvim" }, -- code actions
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dependency
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- dependency
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- dependency
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" }, -- lualine

	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, -- markdown
	{
		src = "https://github.com/iamcco/markdown-preview.nvim",
	}, -- markdown

	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
	-- Colorschemes
	{ src = "https://github.com/vague-theme/vague.nvim" },
	-- Nvimtree
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

-- color schemes
require("vague").setup({ transparent = false })
vim.cmd("colorscheme vague")

require("mini.surround").setup({})
require("harpoon").setup({})
require("lualine").setup({})
require("nvim-tree").setup({
	hijack_cursor = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		side = "right",
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true,
		icons = {
			glyphs = {
				default = "󰈚",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
				},
				git = { unmerged = "" },
			},
		},
	},
})

require("oil").setup({})
require("Comment").setup({})
require("autoclose").setup({})
require("nvim-ts-autotag").setup({})

require("nvim-treesitter").setup({
	ensure_installed = { "lua", "typescript", "javascript", "tsx", "html", "css" },
})

-- telescope configurations
require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			-- hidden = true
		},
		live_grep = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		diagnostics = {
			theme = "dropdown",
		},
		marks = {
			theme = "dropdown",
		},
	},
})

-- git signs
require("gitsigns").setup({ signcolumn = true })
-- Mason
require("mason").setup({})
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
	ensure_installed = { "lua_ls", "stylua" },
})
-- devicons
require("nvim-web-devicons").setup({})
-- blink autocompletion
require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	completion = {
		documentation = {
			auto_show = true,
		},
	},
})

require("actions-preview").setup({})
require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})
