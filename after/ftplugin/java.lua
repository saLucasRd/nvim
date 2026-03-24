local jdtls = require("jdtls")
local home = os.getenv("HOME")

local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "gradlew" })

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls-workspace/" .. project_name

local mason_path = vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls")
local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_dir = mason_path .. "/config_linux"

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
		launcher_jar,
		"-configuration",
		config_dir,
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,

	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
		},
	},
}

-- 5. Iniciar o servidor
jdtls.start_or_attach(config)
