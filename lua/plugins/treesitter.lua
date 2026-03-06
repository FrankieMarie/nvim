return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Install parsers
    require("nvim-treesitter").install({
      "lua", "vim", "vimdoc", "bash", "python",
      "javascript", "typescript", "tsx",
      "html", "css", "json", "yaml", "toml",
      "markdown", "markdown_inline",
    })

    -- Enable treesitter highlighting for all filetypes with a parser
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
