return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      offsets = {
        { filetype = "NvimTree", text = "Explorer", highlight = "Directory", separator = true },
      },
      separator_style = "thin",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
  },
}
