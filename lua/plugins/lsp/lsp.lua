return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = { "neovim/nvim-lspconfig", "saghen/blink.cmp" },
		ft = "java",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- pyhton
			vim.lsp.config("basedpyright", {
				install = true,
				capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
			vim.lsp.enable("basedpyright")

			vim.lsp.config("ruff", {
				install = true,
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.hoverProvider = false
				end,
			})
			vim.lsp.enable("ruff")

			-- lua
			vim.lsp.config("lua_ls", {
				install = true,
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})
			vim.lsp.enable("lua_ls")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					local nmap = function(keys, func, desc)
						vim.keymap.set("n", keys, func, {
							buffer = ev.buf,
							noremap = true,
							silent = true,
							desc = " " .. desc,
						})
					end

					nmap("<leader>gr", require("telescope.builtin").lsp_references, "References")
					nmap("<leader>gd", vim.lsp.buf.definition, "Goto Definition")
					nmap("<leader>gi", vim.lsp.buf.implementation, "Goto Implementation")
					nmap("<leader>gt", vim.lsp.buf.type_definition, "Type Definition")
					nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					nmap("<leader>cf", function()
						vim.lsp.buf.format({ async = true })
					end, "Format File")
					nmap("<leader>cr", vim.lsp.buf.rename, "Rename")
					nmap("K", vim.lsp.buf.hover, "Hover")
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
			})
		end,
	},
}
