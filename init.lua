vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")

if not vim.g.vscode then
	require("config.lazy")
	require("config.ui")
	require("config.statusline")
end
