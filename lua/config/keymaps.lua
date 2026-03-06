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
else
	-- native LSP keymaps
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local map = function(keys, func)
				vim.keymap.set("n", keys, func, { buffer = args.buf })
			end
			map("gd", vim.lsp.buf.definition)
			map("gr", vim.lsp.buf.references)
			map("K", vim.lsp.buf.hover)
			map("<leader>ca", vim.lsp.buf.code_action)
			map("<leader>rn", vim.lsp.buf.rename)
			map("<leader>f", function() vim.lsp.buf.format({ async = true }) end)
		end,
	})
end
