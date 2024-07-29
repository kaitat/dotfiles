return {
  "iamcco/markdown-preview.nvim",
  build = ":call mkdp#util#install()",
  ft = { "markdown", "pandoc.markdown", "rmd", "telekasten" },
	cond = not is_vscode(),
}
