---@type LazySpec
return {
	"lambdalisue/vim-kensaku",
	event = { "User DenopsReady" },
	dependencies = { "vim-denops/denops.vim" },
  cond = not is_vscode(),
	config = function(spec)
		require("denops-lazy").load(spec.name)
	end,
}
