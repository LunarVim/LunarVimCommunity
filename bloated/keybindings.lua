vim.cmd [[ nnoremap <C-n>i <C-i> ]]
vim.api.nvim_set_keymap("n", "<S-x>", ":BufferClose<CR>", { noremap = true, silent = true })
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbol Outline" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings["T"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings["gd"] = { "<cmd>DiffviewOpen HEAD~1<cr>", "Diff" }
lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" }
lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require('dapui').eval()<cr>", "Eval" }
lvim.builtin.which_key.mappings["lf"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" }
lvim.builtin.which_key.mappings["r"] = "Run"
lvim.builtin.which_key.mappings["m"] = "Make"
lvim.builtin.which_key.mappings["t"] = "Test"
lvim.builtin.which_key.mappings["H"] = "Help"
