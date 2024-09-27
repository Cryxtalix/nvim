return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "clangd",
          "lua_ls",
          "marksman",
          "pyright",
          "rust_analyzer",
        }
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

      lspconfig.bashls.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.marksman.setup({})
      lspconfig.pyright.setup({})
      lspconfig.rust_analyzer.setup({})
    end
  }
}
