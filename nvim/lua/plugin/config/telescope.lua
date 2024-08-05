function on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    vim.schedule(function()
      fn(name)
    end)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

---@param name string
local le = function(name)
	on_load("telescope.nvim", function()
		require("telescope").load_extension(name)
	end)
end

---@type LazySpec[]
return {
	{
		name = "telescope-keymap",
		dir = "",
		event = "VeryLazy",
		keys = {
			{ "tel", "Telescope", mode = "ca" },
		},
		cond = not is_vscode(),
		config = function()
			local function telescope_grep_any()
				local builtin = require("telescope.builtin")
				local telescope_any = require("telescope-any")
				local extensions = require("telescope").extensions
				local grep_telescope_any = telescope_any.create_telescope_any({
					pickers = {
						["k "] = { extensions.kensaku.kensaku, "Kensaku" },
						[""] = extensions.egrepify.egrepify,
					},
				})
				grep_telescope_any()
			end
			require("which-key").register({
				[","] = {
					name = "+Telescope",
					[","] = {
						[[<cmd>Telescope smart_open<cr>]],
						"Smart Open",
					},
					["<space>"] = { telescope_grep_any, "live_grep or kensaku" },
					["d"] = {
						[[<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>]],
						"current_buffer_fuzzy_find",
					},
					["<cr>"] = { [[<cmd>Telescope<cr>]], "open Telescope" },
					["s"] = { [[<cmd>Telescope grep_string<cr>]], "grep_string", mode = { "n", "x" } },
					["t"] = { [[<cmd>TodoTelescope<cr>]], "TODO" },
					["r"] = { [[<cmd>Telescope resume<cr>]], "resume" },
					["b"] = { [[<cmd>Telescope buffers<cr>]], "buffers" },
					["h"] = { [[<cmd>Telescope help_tags<cr>]], "help tags" },
					["H"] = { [[<cmd>Telescope heading<cr>]], "heading" },
					["j"] = { [[<cmd>Telescope jumplist<cr>]], "jumplist" },
					["g"] = { [[<cmd>Telescope git_files<cr>]], "git files" },
					["S"] = { [[<cmd>Telescope git_status<cr>]], "git status" },
					["q"] = { [[<cmd>Telescope quickfix<cr>]], "quickfix" },
					["p"] = { [[<cmd>Telescope commands<cr>]], "commands" },
					["P"] = { [[<cmd>Telescope projects<cr>]], "projects" },
					["m"] = { [[<cmd>Telescope marks<cr>]], "marks" },
					["c"] = { [[<cmd>Telescope colorscheme<cr>]], "colorscheme" },
					["l"] = { [[<cmd>Telescope lazy<cr>]], "Lazy" },
					["f"] = {
						[[<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--smart-case,--files<cr>]],
						"Find Files",
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		cond = not is_vscode(),
		cmd = { "Telescope" },
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", config = le("fzf") },
			{ "nvim-telescope/telescope-live-grep-args.nvim", config = le("live_grep_args") },
			{ "nvim-telescope/telescope-symbols.nvim" },
			{ "nvim-telescope/telescope-github.nvim", config = le("gh") },
			{ "LinArcX/telescope-env.nvim", config = le("env") },
			{ "crispgm/telescope-heading.nvim", config = le("heading") },
			{ "LinArcX/telescope-changes.nvim", config = le("changes") },
			{ "tsakirist/telescope-lazy.nvim", config = le("lazy") },
			{ "jvgrootveld/telescope-zoxide", config = le("zoxide") },
			{
				"Allianaab2m/telescope-kensaku.nvim",
				dependencies = { "lambdalisue/vim-kensaku" },
				config = le("kensaku"),
			},
			{ "fdschmidt93/telescope-egrepify.nvim", config = le("egrepify") },
			{
				"danielfalk/smart-open.nvim",
				dependencies = {
					"kkharji/sqlite.lua",
					{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
					"nvim-telescope/telescope-fzy-native.nvim",
				},
				config = le("smart_open"),
			},
			{ "d00h/telescope-any" },
			{ "nvim-telescope/telescope-ghq.nvim", config = le("ghq") },
			-- {
			-- 	"nvim-telescope/telescope-frecency.nvim",
			-- 	config = le("frecency"),
			-- },
			-- {
			-- 	"nvim-telescope/telescope-media-files.nvim",
			-- 	dependencies = {
			-- 		"nvim-lua/plenary.nvim",
			-- 		"nvim-lua/popup.nvim",
			-- 	},
			-- 	config = le("media_files"),
			-- },
		},
		init = function()
			vim.api.nvim_create_autocmd("BufReadPost", {
				pattern = "*",
				callback = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local previewers = require("telescope.previewers")
			local themes = require("telescope.themes")

			---@param filepath string: path to the file to preview
			---@param bufnr number: buffer number to load the file into
			---@param opts table: options table
			---@return nil
			local new_maker = function(filepath, bufnr, opts)
				opts = opts or {}

				local expand_filepath = vim.fn.expand(filepath)

				local async = require("plenary.async")

				async.void(function()
					local err, stat = async.uv.fs_stat(expand_filepath)
					assert(not err, err)

					if not stat then
						return
					end
					if stat.size > 100000 then
						return
					else
						return previewers.buffer_previewer_maker(filepath, bufnr, opts)
					end
				end)
			end

			telescope.setup({
				defaults = themes.get_dropdown({
					path_display = {
						filename_first = {
							reverse_directories = true,
						},
					},
					mappings = {
						n = {
							["<ESC>"] = actions.close,
							["q"] = actions.close,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.send_to_loclist + actions.open_loclist,
						},
						i = {
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.send_to_loclist + actions.open_loclist,
							["<CR>"] = function(prompt_bufnr)
								require("telescope.actions").select_default(prompt_bufnr)
								vim.cmd.stopinsert()
							end,
						},
					},
					initial_mode = "insert",
					prompt_prefix = "🔍",
					-- cache_picker = {
					-- 	num_pickers = -1,
					-- },
					vimgrep_arguments = {
						"rg",
						-- "ug",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					file_ignore_patterns = {
						".git/",
					},
					color_devicons = true,
					use_less = true,
					scroll_strategy = "cycle",
					set_env = { ["COLORTERM"] = "truecolor" },
					-- buffer_previewer_maker = new_maker,
					winblend = 20,
					layout_strategy = "flex",
					layout_config = {
						width = 0.8,
						height = 0.8,
						horizontal = {
							mirror = false,
							prompt_position = "top",
							preview_width = 0.5,
						},
						vertical = {
							mirror = false,
							prompt_position = "top",
							preview_height = 0.3,
						},
					},
				}),
				pickers = {
					diagnostics = {
						initial_mode = "normal",
					},
					grep_string = {
						initial_mode = "normal",
					},
					oldfiles = {
						-- initial_mode = "normal",
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						-- case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					file_browser = {
						initial_mode = "normal",
					},
					heading = {
						theme = "dropdown",
						initial_mode = "normal",
						treesitter = true,
					},
					frecency = {
						initial_mode = "normal",
						show_scores = true,
					},
					lazy = {
						mappings = {
							open_in_browser = "<C-o>",
							open_in_find_files = "<C-f>",
							open_in_live_grep = "<C-g>",
							open_plugins_picker = "<C-b>",
						},
					},
				},
			})
		end,
	},
	le = le,
}