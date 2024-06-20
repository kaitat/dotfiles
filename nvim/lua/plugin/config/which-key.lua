return {
	"folke/which-key.nvim",
	event = "VeryLazy",
  cond = not is_vscode(),
	config = function()
		require("which-key").setup({
			plugins = {
				registers = false,
			},
			operators = { gc = "Comments" },
		})
	end,
}
