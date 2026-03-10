-- Keymaps
-- Leader is set in init.lua before this file is loaded.
-- VSCode leader bindings (space *) live in VSCode keybindings.json.

if vim.g.vscode then
	local vscode = require("vscode")

	-- LSP equivalents via vscode actions
	vim.keymap.set("n", "gd", function() vscode.action("editor.action.revealDefinition") end)
	vim.keymap.set("n", "gr", function() vscode.action("editor.action.goToReferences") end)
	vim.keymap.set("n", "K", function() vscode.action("editor.action.showHover") end)

	-- Jump list navigation
	vim.keymap.set("n", "<C-o>", function() vscode.action("workbench.action.navigateBack") end)
	vim.keymap.set("n", "<C-i>", function() vscode.action("workbench.action.navigateForward") end)
else
	-- Navigate between splits with Ctrl+hjkl
	vim.keymap.set("n", "<C-h>", "<C-w>h")
	vim.keymap.set("n", "<C-j>", "<C-w>j")
	vim.keymap.set("n", "<C-k>", "<C-w>k")
	vim.keymap.set("n", "<C-l>", "<C-w>l")

	-- Same navigation from terminal mode (escape terminal first)
	vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
	vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
	vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
	vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

	-- Close current tab (useful for closing diff views)
	vim.keymap.set("n", "<leader>q", "<cmd>tabclose<cr>")

	-- Show diagnostic error on current line
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

	-- Resize code window (shrink/grow Claude on the right)
	vim.keymap.set("n", "<leader>.", "<cmd>vertical resize +5<cr>", { desc = "Widen current window" })
	vim.keymap.set("n", "<leader>,", "<cmd>vertical resize -5<cr>", { desc = "Narrow current window" })

	-- LSP keymaps (only active when an LSP server attaches)
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
			map("<leader>f", function() require("conform").format({ async = true, lsp_format = "fallback" }) end)
		end,
	})
end
