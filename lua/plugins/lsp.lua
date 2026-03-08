return {
  -- LSP installer
  { "mason-org/mason.nvim", opts = {} },
  {
    -- Bridges mason and lspconfig: auto-install and configure LSP servers
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      -- Pass blink.cmp capabilities to all LSP servers
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", {
        root_markers = { ".git" },
        capabilities = capabilities,
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "vtsls", "lua_ls", "astro", "basedpyright", "ruff", "eslint", "tailwindcss" },
      })
    end,
  },
}
