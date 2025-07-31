return {
  -- add mason
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({})
    end
  },

  -- add mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed= { "lua_ls", "pyright" }
      })
    end
  },

  -- add lspconfig
  {
    'neovim/nvim-lspconfig',
    dependencies = {
        {'hrsh7th/nvim-cmp'},
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        settings= {
            python = {
              analysis = {
                  typeCheckingMode= "off"
                }
            }
        }
      })
      lspconfig.lua_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    end
  },

  -- add autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',  -- Completion source for LSP
      'hrsh7th/cmp-buffer',    -- Completion source for buffer text
      'hrsh7th/cmp-path',      -- Completion source for file paths
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(), -- add autocomplete window borders
          documentation = cmp.config.window.bordered(),
        },

        completion = {
            -- autocomplete = false,
        },

        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({select = false}),

            ['<C-Space>'] = cmp.mapping.complete(),

           -- ['<Tab>'] = cmp.mapping(function(fallback)
           --     local col = vim.fn.col('.') - 1

           --     if cmp.visible() then
           --         cmp.select_next_item({behavior = 'select'})
           --     elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
           --         fallback()
           --     else
           --         cmp.complete()
           --     end
           -- end, {'i', 's'}),
        }),

        sources = {
          { name = 'nvim_lsp' },  -- LSP completion
          { name = 'buffer' },    -- Buffer completion
          { name = 'path' },      -- Path completion
        },
      })
    end
  }
}
