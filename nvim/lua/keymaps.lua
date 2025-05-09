---------------------------------------------------------------------------------------------------+
-- Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator | Terminal | Lang-Arg |
-- ================================================================================================+
-- map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |    -     |    -     |
-- nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |    -     |    -     |
-- map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |    -     |    -     |
-- imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |    -     |    -     |
-- cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |    -     |    -     |
-- vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |    -     |    -     |
-- xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |    -     |    -     |
-- smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |    -     |    -     |
-- omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |    -     |    -     |
-- tmap / tnoremap  |    -   |   -    |    -    |   -    |   -    |    -     |    @     |    -     |
-- lmap / lnoremap  |    -   |   @    |    @    |   -    |   -    |    -     |    -     |    @     |
---------------------------------------------------------------------------------------------------+


vim.g.completion_trigger_character = "."

-- hjkl
vim.keymap.set({ "n", "x" }, "j", function()
  if vim.v.count > 0 or #vim.fn.reg_recording() > 0 or #vim.fn.reg_executing() > 0 then
    return "j"
  end
  return "gj"
end, { expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
  if vim.v.count > 0 or #vim.fn.reg_recording() > 0 or #vim.fn.reg_executing() > 0 then
    return "k"
  end
  return "gk"
end, { expr = true })

-- disable keys
-- vim.keymap.set("n", "H", "<Nop>")
-- vim.keymap.set("n", "J", "<Nop>")
-- vim.keymap.set("n", "K", "<Nop>")
-- vim.keymap.set("n", "L", "<Nop>")
vim.keymap.set({ "n", "v" }, "s", "<Nop>")
vim.keymap.set({ "n", "v" }, "S", "<Nop>")

vim.keymap.set("n", "gh", "<Nop>")
vim.keymap.set("n", "gj", "<Nop>")
vim.keymap.set("n", "gk", "<Nop>")
vim.keymap.set("n", "gl", "<Nop>")

-- remap H M L
vim.keymap.set("n", "gH", "H")
vim.keymap.set("n", "gM", "M")
vim.keymap.set("n", "gL", "L")

-- split window
vim.keymap.set("n", "ss", "<cmd>split<cr><C-w>w")
vim.keymap.set("n", "sv", "<cmd>vsplit<cr><C-w>w")

-- move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")

-- tab management
-- require("which-key").register({
--   ["<tab>"] = {
--     name = "+tab",
--     ["<tab>"] = { "<cmd>tabe .<cr>", "new tab" },
--     h = { "<cmd>tabfirst<cr>", "first tab" },
--     j = { "<cmd>tabnext<cr>", "next tab" },
--     k = { "<cmd>tabprevious<cr>", "previous tab" },
--     l = { "<cmd>tablast<cr>", "last tab" },
--     q = { "<cmd>tabclose<cr>", "close tab" },
--   },
-- })

vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<s-tab>", "<cmd>tabprevious<cr>", { silent = true })
vim.keymap.set("n", "th", "<cmd>tabfirst<cr>", { silent = true })
vim.keymap.set("n", "tj", "<cmd>tabprevious<cr>", { silent = true })
vim.keymap.set("n", "tk", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "tl", "<cmd>tablast<cr>", { silent = true })
vim.keymap.set("n", "tt", "<cmd>tabe .<cr>", { silent = true })
vim.keymap.set("n", "tq", "<cmd>tabclose<cr>", { silent = true })

-- buffer management
vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true })


-- jj -> <ESC>
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")

-- disable s because s = cl

vim.keymap.set("n", "s", "<Nop>")

-- terminal mode
vim.keymap.set("t", [[<ESC>]], [[<C-\><C-n>]])

-- command mode
--- Emacs style from yutkat
vim.keymap.set("c", "<C-a>", "<Home>", { silent = false })
if not vim.g.vscode then
  vim.keymap.set("c", "<C-e>", "<End>", { silent = false })
end
vim.keymap.set("c", "<C-f>", "<right>", { silent = false })
vim.keymap.set("c", "<C-b>", "<left>", { silent = false })
vim.keymap.set("c", "<C-d>", "<DEL>", { silent = false })

-- regexp
vim.keymap.set("x", "<Space>r", 'y:%s/<C-r><C-r>"//g<Left><Left>')

-- -- add blank lines
-- local function append_new_lines(offset_line)
--   local peridot = require("peridot")
--   return peridot
--     and peridot.repeatable_edit(function(ctx)
--       local curpos = vim.fn.line(".")
--       local pos_line = curpos + offset_line
--       local n_lines = ctx.count1
--       local lines = require("utils").repeat_element("", n_lines)
--       vim.fn.append(pos_line, lines)
--     end)
-- end
-- vim.keymap.set("n", "<leader>o", append_new_lines(0), { expr = true })
-- vim.keymap.set("n", "<leader>O", append_new_lines(-1), { expr = true })

-- paste in next lines
-- local function paste_in_new_lines(direction)
--   local peridot = require("peridot")
--   return peridot
--       and peridot.repeatable_edit(function(ctx)
--         for _ = 1, ctx.count1 do
--           if direction == 0 then
--             vim.api.nvim_command("pu")
--           elseif direction == -1 then
--             vim.api.nvim_command("pu!")
--           end
--         end
--       end)
--     or ""
-- end
-- vim.keymap.set("n", "<leader>p", paste_in_new_lines(0), { expr = true })
-- vim.keymap.set("n", "<leader>P", paste_in_new_lines(-1), { expr = true })
-- vim.keymap.set("n", "<leader>%", paste_in_new_lines(-1), { expr = true })

-- toggle 0 made by ycino
vim.keymap.set("n", "0", function()
  return string.match(vim.fn.getline("."):sub(0, vim.fn.col(".") - 1), "^%s+$") and "0" or "^"
end, { expr = true, silent = true })

-- Automatically indent with i and A made by ycino
vim.keymap.set("n", "i", function()
  return vim.fn.len(vim.fn.getline(".")) ~= 0 and "i" or '"_cc'
end, { expr = true, silent = true })
vim.keymap.set("n", "A", function()
  return vim.fn.len(vim.fn.getline(".")) ~= 0 and "A" or '"_cc'
end, { expr = true, silent = true })

-- custom
vim.keymap.set("n", "<leader>ws", vim.cmd.ToggleStatusBar)

-- tips
vim.keymap.set("i", "<C-e>", "<C-R>=strftime('%H:%M')<CR>")
-- Germanium
vim.keymap.set({"v"}, "<Space>ger", ":'<,'>Germanium -f=Cica-Regular<CR>")
vim.keymap.set({"n"}, "<Space>ger", ":Germanium -f=Cica-Regular<CR>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_d$')
vim.keymap.set({ "n", "v" }, "<leader>cc", vim.cmd.cclose)
vim.keymap.set("n", "<C-l>", "<cmd>nohlsearch<cr><esc>")
vim.keymap.set("n", "gq", "<cmd>nohlsearch<cr><esc>")
vim.keymap.set({ "n", "v" }, "sf", "%", { remap = true })

vim.keymap.set("", "<c-i>", "<c-i>")


