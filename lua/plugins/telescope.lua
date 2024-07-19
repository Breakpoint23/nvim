
local keymap = vim.keymap
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
     lazy=false,
     dependencies = { 'nvim-lua/plenary.nvim' },
     keys = {
     keymap.set("n","<leader>ff",":Telescope find_files<CR>"),
     keymap.set("n","<leader>fk",":Telescope keymaps<CR>"),
     keymap.set("n","<leader>fg",":Telescope live_grep<CR>"),
     keymap.set("n","<leader>fh",":Telescope help_tags<CR>"),
     keymap.set("n","<leader>fb",":Telescope buffers<CR>"),
     keymap.set("n","<leader>cs",":Telescope colorscheme<CR>"),
     }
    }
