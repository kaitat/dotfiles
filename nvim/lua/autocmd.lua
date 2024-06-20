
local augroup = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = false
    end
  end,
})


vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CursorHold", "CursorHoldI", "WinEnter" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd.checktime()
    end
  end,
  desc = "check if file is modified",
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd.startinsert()
  end,
})

local restore_terminal_mode = vim.api.nvim_create_augroup("restore_terminal_mode", { clear = true })
vim.api.nvim_create_autocmd({ "TermEnter", "TermLeave" }, {
  pattern = "term://*",
  callback = function()
    vim.b.term_mode = vim.fn.mode()
  end,
  group = restore_terminal_mode,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    if vim.b.term_mode == "t" then
      vim.cmd.startinsert()
    end
  end,
  group = restore_terminal_mode,
})
