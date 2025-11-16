local opt = vim.opt

-- Setup Line number and relative line number
opt.number = true
opt.relativenumber = true

-- tabs & indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false
opt.autoindent = true

opt.smartindent = true

opt.wrap = false

-- Scrolloff at 10
opt.scrolloff = 10

-- Add 80 character Column
vim.opt.colorcolumn = "80"

-- Search Settings
opt.ignorecase = true   -- ignores case when searching
opt.smartcase = true    -- if mized cases search then assumes case-sensitive search

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- Colorscheme forced dark
opt.signcolumn = "yes"  -- Show sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split windows
opt.splitright = true   -- Split vertical window to the wright
opt.splitbelow = true   -- Split horizontal window to the bottom

