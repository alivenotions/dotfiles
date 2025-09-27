-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set highlight on search
vim.o.hlsearch = true
-- Search as characters are entered
vim.o.incsearch = true

vim.o.splitbelow = true
vim.o.splitright = true
-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.cmdheight = 2
vim.o.laststatus = 2
vim.o.showmatch = true
vim.o.visualbell = true

vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 10
vim.o.foldenable = false
vim.o.foldlevel = 2

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.opt["guicursor"] = "a:blinkon0"

vim.g.copilot_assume_mapped = true

-- If you want gitignored files:
-- let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden'