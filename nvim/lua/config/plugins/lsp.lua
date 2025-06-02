return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			-- Consistent ronding for boders
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = false,
				float = {
					border = "rounded",
					source = true,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.WARN] = "WarningMsg",
					},
				},
			})

			require 'lspconfig'.vtsls.setup { capabilities = capabilities }

			require 'lspconfig'.tinymist.setup {
				capabilities = capabilities,
				settings = {
					exportPdf = "never"
				},

			}
			require 'lspconfig'.jsonls.setup { capabilities = capabilities }
			require 'lspconfig'.lua_ls.setup { capabilities = capabilities }
			require 'lspconfig'.clangd.setup { capabilities = capabilities }
			require 'lspconfig'.bashls.setup { capabilities = capabilities }
			require 'lspconfig'.html.setup { capabilities = capabilities }
			require 'lspconfig'.cssls.setup { capabilities = capabilities }
			require 'lspconfig'.rust_analyzer.setup { capabilities = capabilities }

			window = {
				completion = {
					scrollbar = false,
					border = "rounded",
					winhighlight = "Normal:CmpNormal",
				},
				documentation = {
					scrollbar = false,
					border = "rounded",
					winhighlight = "Normal:CmpNormal",
				}
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
					vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
					if not client then return end
					if client.supports_method('textDocument/formatting') then
						-- format current buffer on save
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end,
	},
	-- help lspconfig-all
}
