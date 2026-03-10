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

			-- ════════════════════════════════════════
			-- Lua LSP
			-- ════════════════════════════════════════
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

			-- ════════════════════════════════════════
			-- Java LSP (jdtls) - via nvim-jdtls plugin
			-- ════════════════════════════════════════
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

						local config = {
							cmd = {
								"java",
								"-Declipse.application=org.eclipse.jdt.ls.core.id1",
								"-Dosgi.bundles.defaultStartLevel=4",
								"-Declipse.product=org.eclipse.jdt.ls.core.product",
								"-Dlog.level=WARN",
								"-noverify",
								"-Xmx1G",
								"--add-modules=ALL-SYSTEM",
								"--add-opens",
								"java.base/java.util=ALL-UNNAMED",
								"--add-opens",
								"java.base/java.lang=ALL-UNNAMED",
								"-jar",
								vim.fn.glob(
									home
										.. "/.cache/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
								),
								"-configuration",
								home .. "/.cache/nvim/mason/packages/jdtls/config_linux",
								"-data",
								workspace_dir,
							},
							root_dir = root_dir,
							settings = {
								java = {
									eclipse = { downloadSources = true },
									configuration = { updateBuildConfiguration = "interactive" },
									maven = { downloadSources = true },
									implementationsCodeLens = { enabled = true },
									referencesCodeLens = { enabled = true },
									format = { enabled = true },
								},
							},
							init_options = { bundles = {} },
							capabilities = capabilities,
						}

						jdtls.start_or_attach(config)
					end,
				})
			end

			-- ════════════════════════════════════════
			-- Keybindings (todas as linguagens)
			-- ════════════════════════════════════════
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					local nmap = function(keys, func, desc)
						vim.keymap.set("n", keys, func, {
							buffer = ev.buf,
							noremap = true,
							silent = true,
							desc = "LSP: " .. desc,
						})
					end

					nmap("<C-r>", require("telescope.builtin").lsp_references, "[R]eferences")
					nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					nmap("<leader>gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
					nmap("K", vim.lsp.buf.hover, "Hover")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				end,
			})

			-- ════════════════════════════════════════
			-- Diagnostics
			-- ════════════════════════════════════════
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
