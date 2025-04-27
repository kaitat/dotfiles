return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  enabled=true,
  config = function()
    local nightfox = require("nightfox")
    nightfox.setup({
    	options = {
    		dim_inactive = true, -- Non focused panes set to alternative background
    	},
    })

    if vim.g.colors_name == "terafox" then
      vim.cmd.colorscheme("terafox")
    end
    local compile_path = vim.fn.stdpath("cache") .. "/nightfox"
    if vim.fn.isdirectory(compile_path) == 0 then
    	nightfox.compile()
    end
  end,
}
