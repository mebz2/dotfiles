vim.pack.add({
	{src = "https://github.com/lewis6991/gitsigns.nvim"},
    { src = "https://github.com/mason-org/mason.nvim" },
})

require("gitsigns").setup({signcolumn = false})
require("mason").setup({})
