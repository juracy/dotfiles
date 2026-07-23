vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('config.options')

-- 1. lazy.nvim - auto install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2. Plugin configuration
require("lazy").setup({
  spec = {
    -- First plugin: base46 for Matugen integration from Dank Linux
    {
      "AvengeMedia/base46",
      lazy = false,      -- Load immediately
      priority = 1000,   -- High priority during startup
    },

    -- Future plugins can be added here, for example:
    -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = "make",
        },
      },
      config = function()
        local telescope = require("telescope")
        telescope.setup({
          -- Default configurations can go here
        })
        telescope.load_extension("fzf")

        -- Keymaps
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
        vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help Tags" })
      end,
    },
    {
      'mikesmithgh/kitty-scrollback.nvim',
      enabled = true,
      lazy = true,
      cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
      event = { 'User KittyScrollbackLaunch' },
      -- version = '*', -- latest stable version, may have breaking changes if major version changed
      -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
      config = function()
        require('kitty-scrollback').setup()
      end,
    },
  },
  -- Additional lazy configurations (optional)
  install = { colorscheme = { "habamax" } }, -- Default fallback colorscheme if base46 fails
  checker = { enabled = true }, -- Automatically check for plugin updates in the background
})

vim.cmd("colorscheme dms")
