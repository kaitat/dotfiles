return {
	"CopilotC-Nvim/CopilotChat.nvim",
	event = "VeryLazy",
  cond = not is_vscode(),
	branch = "canary",
	dependencies = {
		{ "github/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	opts = {
		debug = true,
	},
  keys = {
    { "<Space>cq", "<cmd>CopilotChatOpen<CR>" },
  }
}
