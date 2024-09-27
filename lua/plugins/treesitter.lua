return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "rust",
        "c",
        "python",
        "bash",
        "comment",
        "markdown",
        "yaml",
        "make",
        "cmake",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
