-- check if lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local lazy = require("lazy")
-- load plugins
lazy.setup({
        spec = {
          { import = "plugin.config" },
        },
        dev = {
                path = "~/.local/share/ghq-src/github.com/kaitat",
        },
	defaults = { lazy = true },
	install = { missing = true, colorscheme = { "nordfox" } },
	checker = { enabled = false },
	concurrency = 16,
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
