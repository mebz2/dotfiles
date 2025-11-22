vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                   version = vim.version.range("^1") },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	-- { src = "https://github.com/norcalli/nvim-colorizer.lua" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({})
require("vague").setup({
	transparent = true,
})
vim.cmd("colorscheme vague ")

require("oil").setup({})

require("Comment").setup({})
require("ibl").setup({})
-- require("colorizer").setup() -- not working on nightly yet
require("autoclose").setup({})
require("nvim-ts-autotag").setup({})

require("nvim-treesitter").setup({
	ensure_installed = { "lua", "typescript", "javascript", "tsx", "html", "css" }
})

require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown"
		},
		live_grep = {
			theme = "dropdown"
		},
		buffers = {
			theme = "dropdown"
		},
		diagnostics = {
			theme = "dropdown"
		},

	}
})
require("gitsigns").setup({ signcolumn = true })
require("mason").setup({})
require("nvim-web-devicons").setup({})
require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	completion = {
		documentation = {
			auto_show = true,
		}
	},
})
