-- lua_ls: make the LSP aware of neovim runtime files for completions
return {
  settings = {
    Lua = {
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
    },
  },
}
