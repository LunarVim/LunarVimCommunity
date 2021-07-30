lvim.plugins = {
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_hide_inactive_statusline = true
      local _time = os.date "*t"
      if _time.hour < 9 then
        vim.g.tokyonight_style = "night"
      end
      vim.cmd [[
      colorscheme tokyonight
      ]]
    end,
    cond = function()
      local _time = os.date "*t"
      return (_time.hour >= 0 and _time.hour < 16)
    end,
  },
  {
    "NTBBloodbath/doom-one.nvim",
    config = function()
      vim.g.doom_one_italic_comments = true
      vim.cmd [[
      colorscheme doom-one
      ]]
    end,
    cond = function()
      local _time = os.date "*t"
      return (_time.hour >= 16 and _time.hour < 20)
    end,
  },
  {
    "glepnir/zephyr-nvim",
    config = function()
      vim.cmd [[
      colorscheme zephyr
      ]]
    end,
    cond = function()
      local _time = os.date "*t"
      return (_time.hour >= 20 and _time.hour <= 24)
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").on_attach()
    end,
    event = "InsertEnter",
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      }
    end,
    event = "BufWinEnter",
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
    event = "BufRead",
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
    cmd = "Trouble",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
      }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
    end,
  },
  { "tzachar/compe-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-compe", event = "InsertEnter" },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        dimming = {
          alpha = 0.25,
          color = { "Normal", "#ffffff" },
        },
        context = 15,
        expand = {
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {},
      }
    end,
    cmd = "ZenMode",
  },
  { "kevinhwang91/nvim-bqf", event = "BufRead" },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
    ft = "python",
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence"):setup {
        -- General options
        auto_update = true,
        neovim_image_text = "LunarVim to the moon",
        main_image = "file",
        client_id = "793271441293967371",
        log_level = nil,
        debounce_timeout = 10,
        enable_line_number = true,
        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
      }
    end,
  },
  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup()
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local opts = {
        tools = {
          autoSetHints = true,
          hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
          },
          hover_actions = {
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },
          },
        },
        server = {
          cmd = { DATA_PATH .. "/lspinstall/rust/rust-analyzer" },
          on_attach = require("lsp").common_on_attach,
        },
      }
      require("rust-tools").setup(opts)
    end,
    ft = { "rust", "rs" },
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 1,
          height = 0.9,
          width = 0.85,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
          },
        },
        plugins = {
          gitsigns = { enabled = false },
          tmux = { enabled = false },
          twilight = { enabled = true },
        },
        on_open = function()
          vim.lsp.diagnostic.disable()
          vim.cmd [[
          set foldlevel=10
          IndentBlanklineDisable
          ]]
        end,
        on_close = function()
          vim.lsp.diagnostic.enable()
          vim.cmd [[
          set foldlevel=5
          IndentBlanklineEnable
          ]]
        end,
      }
    end,
  },
}
