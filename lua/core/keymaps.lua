-- mapleader configuration
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- misc
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Scroll headroom
vim.opt.scroll = 8
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 0

-- Use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Realive line number set
vim.opt.number = true
vim.opt.relativenumber = false

-- Splitting configuration
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Remove Highlighting
vim.keymap.set('n', '<leader>nh', ':nohlsearch<CR>', { noremap = true, silent = true, desc = "No Highlight" })

-- Window navigation
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true, desc = "Window Left" })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true, desc = "Window Down" })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true, desc = "Window Up" })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true, desc = "Window Right" })

-- Smoother Half-page style scrolling
vim.keymap.set("n", "<C-d>", "10j", { silent = true })
vim.keymap.set("n", "<C-u>", "10k", { silent = true })

-- List buffers
-- vim.keymap.set("n", "<leader>bl", ":ls<CR>", { noremap = true, silent = true })

-- Previous / next buffer
vim.keymap.set("n", "<leader>bp", ":ls<CR>", { noremap = true, silent = true, desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>bn", ":ls<CR>", { noremap = true, silent = true, desc = "Buffer Next" })

-- Open Specific buffer
vim.keymap.set("n", "<leader>bb", function()
  local num = vim.fn.input("Buffer nummber: ")
  if num ~= "" then
    vim.cmd("buffer " .. num)
  end
end, { noremap = true, silent = true, desc = "Open Specific Buffer" })

-- Previous buffer in horizontal split
vim.keymap.set("n", "<leader>bsh", ":split | bp<CR>", { noremap = true, silent = true, desc = "Buffer Split Horizontal" })

-- Previous buffer in vertical split
vim.keymap.set("n", "<leader>bsv", ":vsplit | bp<CR>", { noremap = true, silent = true, desc = "Buffer Split Vertical" })

-- Close current split
vim.keymap.set("n", "<leader>wc", ":close<CR>", { noremap = true, silent = true, desc = "Window Close" })

