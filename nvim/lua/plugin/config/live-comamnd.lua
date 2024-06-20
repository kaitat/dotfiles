-- 動かし方がわからなかった
return {
	"smjonas/live-command.nvim",
	event = "VeryLazy",
  cond = not is_vscode(),
	opts = {
		commands = {
			Norm = { cmd = "norm" },
		},
	},
	config = function(_, opt)
		require("live-command").setup(opt)
	end,
}
