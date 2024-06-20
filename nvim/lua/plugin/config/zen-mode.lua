return {
	"folke/zen-mode.nvim",
	cond = not is_vscode(),
	event = "VeryLazy",
	cmd = { "ZenMode" },
	opts = {},
}
