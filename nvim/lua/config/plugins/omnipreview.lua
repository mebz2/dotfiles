return {
	"sylvanfranklin/omni-preview.nvim",
	dependencies = {
		-- for markdown
		{ "toppair/peek.nvim",            lazy = true, build = "deno task --quiet build:fast" },
		{ 'chomosuke/typst-preview.nvim', lazy = true },
	},
	keys = {
		{ "<leader>po", "<cmd>OmniPreview start<CR>", desc = "OmniPreview Start" },
		{ "<leader>pc", "<cmd>OmniPreview stop<CR>",  desc = "OmniPreview Stop" },
	},

	config = function()
		require("omni-preview").setup({
			auto_load = true,
			app = 'google-chrome-stable',
			close_on_bdelete = true,
			update_on_change = true,
			throttle_time = 200,
		})
		require("peek").setup({ app = "google-chrome-stable" })
		require("typst-preview").setup({
			dependencies_bin = {
				['tinymist'] = "/usr/bin/tinymist"
			},

		})
	end
}
