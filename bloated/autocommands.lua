-- Autocommands
lvim.autocommands.custom_groups = {
  -- c, cpp
  { "Filetype", "c,cpp", "nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('make ;read')<CR>" },
  { "Filetype", "c,cpp", "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('make run;read')<CR>" },
  {
    "Filetype",
    "c,cpp",
    "nnoremap <leader>t <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='make test;read', hidden =false}:toggle()<CR>",
  },
  { "Filetype", "cpp", "nnoremap <leader>H <Cmd>ClangdSwitchSourceHeader<CR>" },

  -- rust
  { "Filetype", "rust", "nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('cargo build;read')<CR>" },
  { "Filetype", "rust", "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('cargo run;read')<CR>" },
  {
    "Filetype",
    "rust",
    "nnoremap <leader>t <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='cargo test -- --ignored;read', hidden =false}:toggle()<CR>",
  },
  { "Filetype", "rust", "nnoremap <leader>H <cmd>lua require('core.terminal')._exec_toggle('cargo clippy;read')<CR>" },
  { "Filetype", "rust", "nnoremap <leader>lm <Cmd>RustExpandMacro<CR>" },
  { "Filetype", "rust", "nnoremap <leader>lH <Cmd>RustToggleInlayHints<CR>" },
  { "Filetype", "rust", "nnoremap <leader>le <Cmd>RustRunnables<CR>" },
  { "Filetype", "rust", "nnoremap <leader>lh <Cmd>RustHoverActions<CR>" },

  -- python
  {
    "Filetype",
    "python",
    "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('python " .. vim.fn.expand "%" .. ";read')<CR>",
  },
  {
    "Filetype",
    "python",
    "nnoremap <leader>t <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='python -m test -j0;read', hidden =false}:toggle()<CR>",
  },
  {
    "Filetype",
    "python",
    "nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('echo \"compile :pepelaugh:\";read')<CR>",
  },
}
