-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")

-- Make UI components transparent (uses terminal background)
local function set_transparent()
	local groups = {
		"Normal", "NormalNC", "EndOfBuffer", "NormalFloat", "FloatBorder",
		"SignColumn", "LineNr",
		"TabLine", "TabLineFill", "TabLineSel", "ColorColumn",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF10F0", bg = "none", bold = true })

-- Floating windows: visible background + rounded border
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e1e" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#767676", bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#1c1c1c", bg = "#af87af" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#1c1c1c", bg = "#af87af" })
vim.o.winborder = "rounded"

-- UI layout
vim.opt.signcolumn = "yes"    -- prevent layout shift from LSP diagnostics
vim.opt.colorcolumn = "100"
vim.opt.cmdheight = 1
vim.opt.showmode = false      -- mode is shown in custom statusline instead
vim.opt.pumheight = 10        -- max completion popup items
vim.opt.pumblend = 10         -- slight transparency on completion popup
vim.opt.winblend = 0
vim.opt.lazyredraw = false
vim.opt.fillchars = { eob = " " } -- hide ~ on empty lines

-- Cursor: block in all modes, blinking enabled
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Treesitter-based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
