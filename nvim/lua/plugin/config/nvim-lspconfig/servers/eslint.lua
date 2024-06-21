local lsp_utils = require("plugin.config.nvim-lspconfig.utils")
local ft = lsp_utils.ft
local setup = lsp_utils.setup
local format_config = lsp_utils.format_config

local filetype = ft.js_framework_like

---@type LazySpec
return {
	name = "eslint",
	dir = "",
	dependencies = {
    "cli",
		"neovim/nvim-lspconfig",
	},
	ft = filetype,
	opts = function()
		return {
			on_attach = format_config(true),
		}
	end,
	config = function(spec, opts)
		setup(spec.name, opts)
	end,
}
