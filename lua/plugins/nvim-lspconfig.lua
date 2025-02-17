local on_attach = require("utils.lsp").on_attach

local config = function()
  require("neoconf").setup({})  

  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")

  local capabilities = cmp_nvim_lsp.default_capabilities()
    -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
              },
            },
          },
        },
      })

    

  
    -- python
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
        pyright = {
          disableOrganizeImports = false,
          analysis = {
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            autoImportCompletions = true,
                },
              },
            },

      })

  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  local flake8 = require("efmls-configs.linters.flake8")
  local black = require("efmls-configs.formatters.black")  
  lspconfig.efm.setup({
    filetypes = {
    "lua",
    "python"
    },

    init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
    
    },

    setings = {
      languages = {
        lua = {luacheck,stylua},
        python = {flake8,black}
      },

    },




    })


  -- local lsp_format_group = vim.api.nvim_create_augroup("LspFormattingGroup",{})
  -- vim.api.vim_create_autocmd("BufWritePost",{
  --   group = lsp_format_group,
  --   callback = function()
  --     local efm = vim.lsp.get_active_clients({name="efm"})
  --   
  --     if vim.tbl_isempty(efm) then
  --       return 
  --     end
  --   vim.lsp.buf.format({name="efm"})
  --   end,
  --
  --
  -- })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
  },

}
