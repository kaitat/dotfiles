vim.g.colorterm = os.getenv("COLORTERM")
if vim.tbl_contains({ "truecolor", "24bit", "rxvt", "" }, vim.g.colorterm) then
  if tb(vim.fn.exists("+termguicolors")) then
    vim.o.termguicolors = true
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
  end
end

vim.opt.list = true
vim.opt.laststatus = 3
vim.opt.cmdheight = 2

vim.opt.listchars = {
  tab = "▸▹┊",
  trail = "▫",
  extends = "❯",
  precedes = "❮",
}

if vim.o.termguicolors then
  vim.g.colors_name = "terafox"
end
