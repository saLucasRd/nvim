return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.api.nvim_create_autocmd("LspAttach", {
						group = vim.api.nvim_create_augroup("UserLspConfig", {}),
						callback = function(ev)
							local nmap = function(keys, func, desc)
								vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
							end

							nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
							nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
							nmap("K", vim.lsp.buf.hover, "Hover Documentation ([K]ind)")
							nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
							nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

							-- Checking
							nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
							nmap(
								"<leader>ds",
								require("telescope.builtin").lsp_document_symbols,
								"[D]ocument [S]ymbols"
							)
						end,
					})
				end,
			})
		end,
	},
}
