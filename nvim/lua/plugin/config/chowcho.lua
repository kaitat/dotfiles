return {
  "tkmpypy/chowcho.nvim",
  cond = not is_vscode(),
  keys = {
    { "<Leader>wq", "<CMD>Chowcho<CR>" },
  },
}
