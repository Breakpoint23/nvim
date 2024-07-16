local keymap = vim.keymap

local M = {}

M.on_attach = function(client,bufnr)

  local opts = {noremap = true , silent = true , buffer = bufnr}

  keymap.set("n","<leader>gd","<cmd>Lspsaga goto_definition<CR>",opts)
  keymap.set("n","gd","<cmd>Lspsaga peek_definition<CR>",opts)
  keymap.set("n","<leader>rn","<cmd>Lspsaga rename<CR>",opts)
  keymap.set("n","<leader>D","<cmd>Lspsaga show_line_diagnostics<CR>",opts)
  keymap.set("n","<leader>d","<cmd>Lspsaga show_cursor_diagnostics<CR>",opts)
  keymap.set("n","K","<cmd>Lspsaga hover_doc<CR>",opts)
  

  if client.name == "pyright" then
    keymap.set("n","<leader>oi","<cmd>PyrightOrganizeImports<CR>",opts)
  end
end
return M
