return  {
"goolord/alpha-nvim",
  event="BufEnter",
  cond = not is_vscode(),
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = vim.fn.readfile(vim.fn.expand("~/.config/nvim/lua/files/neovim.txt"))
    --dashboard.section.footer.val = "Total plugins: " .. require("packer").count_plugins()
    dashboard.section.header.opts.hl = "Question"
    -- dashboard.section.header.val = vim.fn.readfile(vim.fn.expand("~/.config/nvim/lua/files/dashboard_custom_header.txt"))
    dashboard.section.buttons.val = {
      dashboard.button("e", " New file", ":enew<CR>"),
      dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
			dashboard.button("s", "  Restore Session", '<cmd>lua require("persistence").load()<cr>'),
      dashboard.button("o", " Old Session file", ":Telescope oldfiles<CR>"),
      dashboard.button("b", " Jump to bookmarks", ":Telescope marks<CR>"),
			dashboard.button(".", "󰈙  Oil", "<cmd>Oil<cr>"),
      dashboard.button("n", " Memo New", ":Telekasten new_note<CR>"),
      dashboard.button("t", " Memo Today", ":Telekasten goto_today<CR>"),
      dashboard.button("w", " Memo Week", ":Telekasten goto_thisweek<CR>"),
			dashboard.button("z", "󰒲  Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("q", " Exit", ":qa<CR>"),
    }
    alpha.setup(dashboard.config)
  end,
}
