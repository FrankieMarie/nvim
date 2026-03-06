return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", {
        root_markers = { ".git" },
        capabilities = capabilities,
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "vtsls", "lua_ls", "astro", "basedpyright", "ruff" },
      })
    end,
  },
}
