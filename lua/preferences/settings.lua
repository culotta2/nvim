-- General
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.opt.cursorline = true
vim.opt.inccommand = 'split'
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.undofile = true

vim.opt.updatetime = 250
vim.o.timeout = true
vim.opt.timeoutlen = 300

-- Display characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Casing
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight search
vim.opt.hlsearch = true

-- New split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Coloring
-- vim.opt.termguicolors = true
-- vim.cmd("set background=dark")

-- Scroll
vim.opt.scrolloff = 10

-- Use ripgrep
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"


-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Disable the mouse
vim.opt.mouse = nil

-- Set shell
vim.opt.shell = "zsh"

