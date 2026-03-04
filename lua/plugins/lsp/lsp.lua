return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},

		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("lua_ls", {
				install = true, -- Optional: asks lspconfig to manage the binary if supported
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})

			vim.lsp.enable("lua_ls")

			vim.lsp.config("jdtls", {
				install = true,
				cmd = { "jdtls" },
				capabilities = capabilities,
				root_dir = require("lspconfig.util").root_pattern("pom.xml", "gradle.build", ".git", "settings.gradle"),
				settings = {
					java = {
						home = os.getenv("JAVA_HOME"),
						eclipse = {
							downloadSources = true,
						},
						configuration = {
							updateBuildConfiguration = "interactive",
						},
						maven = {
							downloadSources = true,
						},
						implementationCodeLens = {
							enabled = true,
						},
						referencesCodeLens = {
							enabled = true,
						},
						format = {
							enabled = true,
						},
					},
				},
				init_option = {
					bundles = {},
				},
			})
			vim.lsp.enable("jdtls")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					local nmap = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					nmap("<leader>cl", vim.lsp.codelens.run, "[C]ode [L]ens")

					nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					nmap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					nmap("<leader>gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
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
