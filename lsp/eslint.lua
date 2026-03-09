-- Auto-fix ESLint issues on save
return {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.fixAll.eslint" } },
          apply = true,
        })
      end,
    })
  end,
}
