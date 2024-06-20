vim.api.nvim_create_user_command("ToggleStatusBar", function()
  if vim.o.laststatus == 3 then
    vim.opt.laststatus = 0
  else
    vim.opt.laststatus = 3
  end
end, { nargs = 0, force = true })


-- terminal
local function openTerm(args)
  local tf = vim.cmd.terminal
  if args == "" then
    tf()
  else
    tf(args)
  end
end
vim.api.nvim_create_user_command("T", function(tbl)
  local args = tbl.args
  vim.cmd.tabe()
  openTerm(args)
end, { nargs = "*" })

vim.api.nvim_create_user_command("TS", function(tbl)
  local args = tbl.args
  local splitbelow = vim.o.splitbelow
  vim.opt.splitbelow = true
  vim.cmd.split()
  openTerm(args)
  vim.opt.splitbelow = splitbelow
end, { nargs = "*" })

vim.api.nvim_create_user_command("TV", function(tbl)
  local args = tbl.args
  local splitright = vim.o.splitright
  vim.opt.splitright = true
  vim.cmd.vsplit()
  openTerm(args)
  vim.opt.splitright = splitright
end, { nargs = "*" })

function CopilotChatBuffer()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end
