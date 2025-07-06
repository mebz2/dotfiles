return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup {
				defaults = {
					path_display = { "smart" },
				},
				pickers = {
					find_files = {
						theme = "dropdown", -- "dropdown"  ivy, "cursor", dropdown
					},
					live_grep = {
						theme = "dropdown"
					},
					buffers = {
						theme = "dropdown"
					},
					help_tags = {
						theme = "dropdown"
					}

				},
				extensions = {
					themes = {
						enable_previewer = false,
						enable_live_preview = false,
					},
					fzf = {}
				}
			}

			require('telescope').load_extension('fzf')


			vim.keymap.set("n", "<space>fg", require('telescope.builtin').git_files)
			vim.keymap.set("n", "<space>gb", require('telescope.builtin').git_branches)
			vim.keymap.set("n", "<space>fr", require('telescope.builtin').lsp_references)
			vim.keymap.set("n", "<space>fw", require('telescope.builtin').live_grep)
			vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
			vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
			vim.keymap.set("n", "<space>fb", require('telescope.builtin').buffers)
			vim.keymap.set("n", "<space>en", function()
				require('telescope.builtin').find_files({
					cwd = vim.fn.stdpath("config")
				})
			end)
		end,
	}
}
