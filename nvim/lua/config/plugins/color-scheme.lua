return {

	{
		'rose-pine/neovim',
		enabled = true,
		config = function()
			require('rose-pine').setup({
				variant = 'main', --main, moon or dawn
				dark_variant = 'main', --main, moon or dawn
				styles = {
					transparency = true,
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end
	},
	--

	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require('catppuccin').setup({
	-- 			flavour = "mocha",
	-- 			background = {
	-- 			},
	-- 			transparent_background = true,
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end
	-- },
	--
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	name = "moonfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("moonfly")
	-- 	end
	-- },
	-- {
	-- 	"vague2k/vague.nvim",
	-- 	config = function()
	-- 		require("vague").setup({ transparent = true })
	-- 		vim.cmd("colorscheme vague")
	-- 		vim.cmd(":hi statusline guibg=NONE")
	-- 	end
	-- },
}
