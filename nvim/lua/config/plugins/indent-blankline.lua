return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			chat = '| ',
		}
	},
	config = function()
		require("ibl").setup()
	end,
}
