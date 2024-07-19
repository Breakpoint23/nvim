local keymap = vim.keymap

local M = {}

M.on_attach = function(client,bufnr)

  local opts = {noremap = true , silent = true , buffer = bufnr}

  keymap.set("n","<leader>gd","<cmd>Lspsaga goto_definition<CR>",opts)
  keymap.set("n","<leader>rn","<cmd>Lspsaga rename<CR>",opts)
  keymap.set("n","<leader>D","<cmd>Lspsaga show_line_diagnostics<CR>",opts)
  keymap.set("n","<leader>d","<cmd>Lspsaga show_cursor_diagnostics<CR>",opts)
  keymap.set("n","K","<cmd>Lspsaga hover_doc<CR>",opts)

  keymap.set("n","gd",require('telescope.builtin').lsp_definitions,opts)
  keymap.set("n","gr",require('telescope.builtin').lsp_references,opts)
  keymap.set("n","gi",require('telescope.builtin').lsp_implementations,opts)
  keymap.set("n","<leader>D",require('telescope.builtin').lsp_type_definitions,opts)
  keymap.set("n","<leader>ds",require('telescope.builtin').lsp_document_symbols,opts)
  keymap.set("n","<leader>ws",require('telescope.builtin').lsp_dynamic_workspace_symbols,opts)
  keymap.set("n","<leader>ca",vim.lsp.buf.code_action,opts)
  

  if client.name == "pyright" then
    keymap.set("n","<leader>oi","<cmd>PyrightOrganizeImports<CR>",opts)
  end
end
return M
