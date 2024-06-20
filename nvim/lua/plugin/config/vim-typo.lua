---@type LazySpec
return {
	"https://github.com/tani/vim-typo",
	lazy = false,
	enabled = true,
  cond = not is_vscode(),
	init = function()
		vim.api.nvim_create_autocmd("InsertEnter", {
			pattern = "*",
			callback = function(args)
				vim.bo[args.buf].syntax = "on"
			end,
		})
	end,
}
