-- Display
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- Indentation (2 spaces)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search (case insensitive unless uppercase is used)
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Editor behavior
vim.opt.showmatch = true                           -- flash matching bracket
vim.opt.completeopt = "menuone,noinsert,noselect"  -- better completion menu
vim.opt.conceallevel = 0                           -- show all markup characters
vim.opt.concealcursor = ""
vim.opt.synmaxcol = 300                            -- limit syntax highlighting per line

-- Persistent undo (survives closing neovim)
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir

-- Timing
vim.opt.updatetime = 300    -- ms before CursorHold fires (used by many plugins)
vim.opt.timeoutlen = 500    -- ms to wait for mapped key sequence
vim.opt.ttimeoutlen = 0     -- no delay for key codes (e.g. escape)

-- File handling
vim.opt.autoread = true     -- reload files changed outside neovim
vim.opt.autowrite = false
vim.opt.hidden = true       -- allow switching buffers without saving

-- General
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")          -- treat hyphenated words as one word
vim.opt.path:append("**")             -- search subdirs with :find
vim.opt.selection = "inclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus") -- yank/paste uses system clipboard
vim.opt.modifiable = true
vim.opt.encoding = "utf-8"

-- Folding (start with all folds open)
vim.opt.foldlevel = 99

-- Splits open in expected direction
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Diff and performance
vim.opt.diffopt:append("linematch:60") -- smarter diff alignment
vim.opt.redrawtime = 10000             -- allow slow syntax/treesitter to finish
vim.opt.maxmempattern = 20000
