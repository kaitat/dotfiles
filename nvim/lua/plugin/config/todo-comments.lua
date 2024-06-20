return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  cond = not is_vscode(),
  event = "BufReadPost",
  config = {},
}
