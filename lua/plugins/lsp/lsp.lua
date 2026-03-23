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

			local jdtls_available, jdtls = pcall(require, "jdtls")
			if jdtls_available then
				vim.api.nvim_create_autocmd("FileType", {
					pattern = "java",
					callback = function()
						local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "gradlew" })
						local home = os.getenv("HOME")
						local workspace_dir = home
							.. "/.cache/jdtls-workspace/"
							.. vim.fn.fnamemodify(root_dir, ":p:h:t")

						local mason_jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"

						local config = {
							cmd = {
								"/usr/lib/jvm/java-21-openjdk/bin/java",
								"-Declipse.application=org.eclipse.jdt.ls.core.id1",
								"-Dosgi.bundles.defaultStartLevel=4",
								"-Declipse.product=org.eclipse.jdt.ls.core.product",
								"-Dlog.level=WARN",
								"-Xmx2G",
								"--add-modules=ALL-SYSTEM",
								"--add-opens",
								"java.base/java.util=ALL-UNNAMED",
								"--add-opens",
								"java.base/java.lang=ALL-UNNAMED",
								"-jar",
								vim.fn.glob(mason_jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
								"-configuration",
								mason_jdtls_path .. "/config_linux",
								"-data",
								workspace_dir,
							},
						}

						jdtls.start_or_attach(config)
					end,
				})
			end

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
