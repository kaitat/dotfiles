---@type LazySpec
return {
	"MeanderingProgrammer/markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "markdown", "telekasten" },
  cond = not is_vscode(),
	opts = {
		-- checkbox = {
		-- 	unchecked = "󰄱 ", -- nf-md-checkbox_blank_outline
		-- 	checked = "󰱒 ", -- nf-md-checkbox_outline
		-- },
		-- quote = "┃",
	},
}
