-- Keymaps
-- Leader is set in init.lua before this file is loaded.
-- VSCode leader bindings (space *) live in VSCode keybindings.json.

if vim.g.vscode then
	local vscode = require("vscode")

	-- lsp (non-leader, handled by neovim directly)
	vim.keymap.set("n", "gd", function() vscode.action("editor.action.revealDefinition") end)
	vim.keymap.set("n", "gr", function() vscode.action("editor.action.goToReferences") end)
	vim.keymap.set("n", "K", function() vscode.action("editor.action.showHover") end)

	-- navigation
	vim.keymap.set("n", "<C-o>", function() vscode.action("workbench.action.navigateBack") end)
	vim.keymap.set("n", "<C-i>", function() vscode.action("workbench.action.navigateForward") end)
end
