vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Migrated from 2017 vimrc
vim.opt.wrap = false
vim.opt.history = 90
vim.opt.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.dcu,.ddp,.exe,.pyc,.dsk"
vim.opt.scrolloff = 5
vim.opt.ruler = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.smartcase = true

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- UI/legibilidade
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.laststatus = 3

-- Performance/UX de edição
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.confirm = true

-- Clipboard/mouse
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 10
