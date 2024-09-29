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
      vim.api.nvim_create_user_command(
        "Definition",
        function()
          vim.lsp.buf.definition()
        end,
        {}
      )
      vim.api.nvim_create_user_command(
        "CodeAction",
        function()
          vim.lsp.buf.code_action()
        end,
        {}
      )


      lspconfig.bashls.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.marksman.setup({})
      lspconfig.pyright.setup({})
      lspconfig.rust_analyzer.setup({})
    end
  }
}
