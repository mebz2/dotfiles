return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'saghen/blink.cmp',
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

			-- Consistent rounding for boders
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = true,
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

			-- Configure borders for LSP-related floating windows
			local function set_lsp_handler_borders(border_style)
				local lsp_handlers = {
					["textDocument/definition"] = vim.lsp.handlers.definition,
					["textDocument/typeDefinition"] = vim.lsp.handlers.type_definition,
					["textDocument/declaration"] = vim.lsp.handlers.declaration,
					["textDocument/implementation"] = vim.lsp.handlers.implementation,
					["textDocument/references"] = vim.lsp.handlers.references,
					-- Add any other handlers that open floating windows if needed
				}

				for name, handler in pairs(lsp_handlers) do
					vim.lsp.handlers[name] = vim.lsp.with(handler, {
						border = border_style,
					})
				end
			end

			set_lsp_handler_borders("rounded")

			-- Optional: A more general override for floating previews opened by LSP utils
			-- This helps catch some edge cases or plugins that might use this utility
			local original_open_floating_preview = vim.lsp.util.open_floating_preview
			vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or "rounded" -- Default to rounded if not specified
				return original_open_floating_preview(contents, syntax, opts, ...)
			end




			require 'lspconfig'.vtsls.setup { capabilities = capabilities }
			require 'lspconfig'.tinymist.setup {
				capabilities = capabilities,
				settings = {
					exportPdf = "never"
				},

			}
			require 'lspconfig'.gopls.setup { capabilities = capabilities }
			require 'lspconfig'.pylsp.setup {
				capabilities = capabilities,
				seettings = {
					pylsp = {
						plugins = {
							ignore = { 'W391' },
							maxLineLength = 100
						}
					}
				}
			}
			require 'lspconfig'.phpactor.setup { capabilities = capabilities }
			require 'lspconfig'.zls.setup { capabilities = capabilities }
			require 'lspconfig'.ruff.setup { capabilities = capabilities }
			require 'lspconfig'.jsonls.setup { capabilities = capabilities }
			require 'lspconfig'.lua_ls.setup { capabilities = capabilities }
			require 'lspconfig'.clangd.setup { capabilities = capabilities }
			require 'lspconfig'.bashls.setup { capabilities = capabilities }
			require 'lspconfig'.html.setup { capabilities = capabilities }
			require 'lspconfig'.cssls.setup { capabilities = capabilities }
			require 'lspconfig'.rust_analyzer.setup { capabilities = capabilities }



			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end
					---@diagnostic disable-next-line: missing-parameter
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
