vim.pack.add({
	{src = "https://github.com/lewis6991/gitsigns.nvim"},
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
    { src = "https://github.com/nvim-tree/nvim-web-devicons"},
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim"},
    { src = "https://github.com/MunifTanjim/nui.nvim"},
    { src = "https://github.com/nvim-lua/plenary.nvim"},
})

require("gitsigns").setup({signcolumn = true})
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
