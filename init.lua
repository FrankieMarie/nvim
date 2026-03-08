-- Set leader key before loading any config (required by lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core config (shared between terminal neovim and vscode-neovim)
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Plugins and UI only load in terminal neovim, not vscode
if not vim.g.vscode then
	require("config.lazy")
	require("config.ui")
	require("config.statusline")
end
