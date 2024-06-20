return {
  'skanehira/preview-markdown.vim',
  cmd={'PreviewMarkdown'},
  cond = not is_vscode(),
  init=function()
    vim.cmd[[
    let g:preview_markdown_parser="glow"
    ]]
  end
}
