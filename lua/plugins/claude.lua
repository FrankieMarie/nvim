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
    config = function(_, opts)
      require("claudecode").setup(opts)
      vim.api.nvim_create_user_command("Claude", "ClaudeCode", {})
    end,
    opts = {
      diff_opts = {
        open_in_new_tab = true,
      },
      terminal = {
        snacks_win_opts = {
          width = 60,
        },
      },
    },
  },
}
