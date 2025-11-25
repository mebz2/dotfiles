vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1")
	},
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dependency
	{ src = "https://github.com/MunifTanjim/nui.nvim" },     -- dependency
	{ src = "https://github.com/nvim-lua/plenary.nvim" },    -- dependency
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	-- { src = "https://github.com/norcalli/nvim-colorizer.lua" }, -- install this when nightly is fixed
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/mvllow/modes.nvim" }, -- different colors for different modes
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2"
	},
	-- Colorschemes
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/kepano/flexoki-neovim" },
	{ src = "https://github.com/catppuccin/nvim" }

})

-- color schemes
require("vague").setup({})
require("rose-pine").setup({ variant = "dawn", })
require("flexoki").setup({})
require("catppuccin").setup({
	flavour = "mocha"
})
vim.cmd("colorscheme flexoki-light")
--
--
require("harpoon").setup({})
require("modes").setup({})
require("lualine").setup({})

require("oil").setup({})
require("Comment").setup({})
-- require("colorizer").setup() -- not working on nightly yet
require("autoclose").setup({})
require("nvim-ts-autotag").setup({})

require("nvim-treesitter").setup({
	ensure_installed = { "lua", "typescript", "javascript", "tsx", "html", "css" }
})

-- telescope configurations
require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			-- hidden = true
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
		marks = {
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
