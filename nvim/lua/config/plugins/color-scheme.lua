return {

	{
		'rose-pine/neovim',
		enabled = true,
		config = function()
			require('rose-pine').setup({
				variant = 'main',  --main, moon or dawn
				dark_variant = 'main', --main, moon or dawn
				styles = {
					transparency = true,
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end
	},


	-- {
	-- 	"vague2k/vague.nvim",
	-- 	config = function()
	-- 		require("vague").setup({ transparent = true })
	-- 		vim.cmd("colorscheme vague")
	-- 		vim.cmd(":hi statusline guibg=NONE")
	-- 	end
	-- },


}
