-- File explorer sidebar (<leader>e to toggle)
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = {
          min = 20,
          max = 50,
        },
      },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
  end,
}
