-- Only install claude plugins if the claude CLI is available
local has_claude = vim.fn.executable("claude") == 1

if not has_claude then
  return {}
end

return {
  { "folke/snacks.nvim", lazy = false, priority = 1000, opts = {} },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    event = "VeryLazy",
    opts = {},
  },
}
