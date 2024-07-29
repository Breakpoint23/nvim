
-- Highlight when yanking text

vim.api.nvim_create_autocmd ('TextYankPost',{

  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('Highlight-Yank',{clear = true}),
  callback = function ()
    vim.highlight.on_yank()
  end,
  
})

vim.api.nvim_create_autocmd("VimEnter",{pattern = "",callback = function ()

  vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
  
end})
