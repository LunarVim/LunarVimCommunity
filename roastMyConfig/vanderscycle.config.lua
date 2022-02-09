-- TODO: learn vim surround, vim-matchup, lazy-git and much more

lvim.autosave = true
--LSP
-- require("lsp-config.tailwindcss")
--TODO: fix selene stylua not beign found
require("lsp-config.lua")
require("lsp-config.bash")
-- require("lsp-config.typescript")
-- require("lsp-config.javascript")
-- require('lsp-config.svelte')
require("lsp-config.python")
require("lsp-config.markdown")
require("lsp-config.tailwindcss")

lvim.autocommands.custom_groups = {
	-- On entering insert mode in any file, scroll the window so the cursor line is centered
	{ "InsertEnter", "*", ":normal zz" },
	-- {"","*", ":<Esc>" }
}

-- general
vim.opt.wrap = true
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
vim.opt.relativenumber = true
--lvim.log.level = "debug"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymappin
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<A-t>"] = ":ToggleTerm<cr>"
lvim.keys.normal_mode["q"] = ""
lvim.keys.normal_mode["<leader>o"] = "o<Esc>" -- FIX THIS BINDING
lvim.keys.normal_mode["<leader>O"] = "0<Esc>"

--TODO: move the keys to which_key plugin
lvim.keys.normal_mode = {
	-- empowered searches
	["<leader>sT"] = ":Telescope current_buffer_fuzzy_find<cr>",
	["<leader>sF"] = ':lua require("telescope.builtin").find_files({hidden=true, no_ignore=true, find_command=rg})<cr>',
	["<leader>si"] = ":Telescope media_files<cr>",
	["<leader>sn"] = ":lua require 'telescope'.extensions.file_browser.file_browser()<CR>", --nnn nexttime?
	["<leader>bt"] = ":Telescope buffers<CR>",
}

-- unmap a default keymappinig
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

lvim.builtin.which_key.mappings["n"] = {
	name = "+package.json",
	s = { ":lua require('package-info').show()<cr>", "show outdated packages" },
	d = { ":lua require('package-info').delete()<cr>", "delete package" },
	p = { ":lua require('package-info').change_version()<cr>", "change package version" },
	i = { ":lua require('package-info').install()<cr>", "install new package" },
	r = { ":lua require('package-info').reinstall()<cr>", "reinstall package" },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

lvim.builtin.notify.active = true
lvim.builtin.notify.opts.background_colour = "normal"
lvim.builtin.cmp.completion.keyword_length = 2
lvim.lsp.automatic_servers_installation = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.autopairs.active = true
lvim.builtin.terminal.active = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"python",
	"lua",
	"bash",
	"dockerfile",
	"html",
	"javascript",
	"json",
	"svelte",
	"typescript",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.keys.normal_mode["<S-x>"] = ":lua require('FTerm').toggle()<CR>"

-- generic LSP settings
-- Additional Plugins
lvim.plugins = {
	-- themes
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim" },
	{ "LunarVim/ColorSchemes" },

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
	},
	{
		"ray-x/navigator.lua",
		requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		config = function()
			vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
			vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")
		end,
	},
	-- movement
	{
		"ggandor/lightspeed.nvim",
		event = "BufRead",
	},

	{
		"tpope/vim-surround",
		keys = { "c", "d", "y" },
	},
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	-- git
	{ "kdheepak/lazygit.nvim" },
	-- search
	{ "mhinz/vim-grepper" },
	-- windows (qickFix and peaking buffer)
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				dismiss_on_move = true,
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
				vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
				vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>"),
				vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>"),
			})
			--gd gpd gD gpR leader + l + d/r/i
			--TODO: remove the extra bindings
		end,
	},
	-- better comment flags
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	--language specific
	--node
	{
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
	},
	-- telescope plugins
	{
		"nvim-telescope/telescope-fzy-native.nvim",
		run = "make",
		event = "BufRead",
	},
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	--markdown
	-- You must install glow globally
	-- https://github.com/charmbracelet/glow
	-- yay -S glow
	{
		"npxbr/glow.nvim",
		ft = { "markdown" },
		-- run = "yay -S glow"
	},

	-- autoSave
	{
		"Pocco81/AutoSave.nvim",
		config = function()
			require("autosave").setup({ debounce_delay = 500 })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = false
		end,
	},
	{ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" },
	-- misc
	--WARN: still in active development plugin
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	-- ssh into anything while using your local tools
	--   {
	--   'chipsenkbeil/distant.nvim',
	--   event = "DistantLaunch",
	--   config = function()
	--     require('distant').setup {
	--       -- Applies Chip's personal settings to every machine you connect to
	--       --
	--       -- 1. Ensures that distant servers terminate with no connections
	--       -- 2. Provides navigation bindings for remote directories
	--       -- 3. Provides keybinding to jump into a remote file's parent directory
	--       ['*'] = require('distant.settings').chip_default()
	--     }
	--   end
	-- }
	{
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
						config = {
							workspaces = {
								my_workspace = "~/neorg",
							},
						},
					},
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	},
	{
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	},
}
