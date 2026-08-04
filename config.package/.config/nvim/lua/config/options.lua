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

-- Treesitter compatibility shim for Neovim 0.10+ / 0.11+ / nvim-treesitter main branch
if vim.treesitter.language then
  vim.treesitter.language.ft_to_lang = vim.treesitter.language.ft_to_lang or vim.treesitter.language.get_lang
end
if vim.treesitter then
  vim.treesitter.ft_to_lang = vim.treesitter.ft_to_lang or vim.treesitter.language.get_lang
end

-- Polyfill for nvim-treesitter main branch functions used by telescope.nvim
local original_require = require
_G.require = function(modname)
  local status, res = pcall(original_require, modname)
  if not status then
    if modname == "nvim-treesitter.configs" then
      return {
        is_enabled = function() return true end,
        get_module = function() return {} end,
        setup = function() end,
      }
    end
    error(res, 2)
  end

  if modname == "nvim-treesitter.parsers" and type(res) == "table" then
    res.ft_to_lang = res.ft_to_lang or vim.treesitter.language.get_lang
    res.get_parser = res.get_parser or vim.treesitter.get_parser
  elseif modname == "nvim-treesitter.configs" and type(res) == "table" then
    res.is_enabled = res.is_enabled or function() return true end
    res.get_module = res.get_module or function() return {} end
    res.setup = res.setup or function() end
  end
  return res
end

-- Safe wrapper for vim.treesitter.highlighter.new to prevent crashes on missing/nil parsers
if vim.treesitter and vim.treesitter.highlighter then
  local orig_highlighter_new = vim.treesitter.highlighter.new
  vim.treesitter.highlighter.new = function(tree, opts)
    if not tree then
      return nil
    end
    local ok, res = pcall(orig_highlighter_new, tree, opts)
    if ok then
      return res
    end
    return nil
  end
end





