local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({
      higroup = "Search",
      timeout = 200,
    })
  end,
})

-- auto-reload files changed outside nvim (e.g. by Claude)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	group = augroup,
	command = "checktime",
})

-- Keep Claude terminal at least 80 columns wide
vim.api.nvim_create_autocmd("WinResized", {
	group = augroup,
	callback = function()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)
			if vim.bo[buf].buftype == "terminal" and vim.api.nvim_win_get_width(win) < 80 then
				vim.api.nvim_win_set_width(win, 80)
			end
		end
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
